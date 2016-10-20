# This feature launches all of the featured images on all of the providers of Jetstream and ensures they get to the networking step

Feature: Launch all featured images

  @persist_browser
  Scenario: Log into atmosphere
    Given a browser
    When I login to Jetstream

  @persist_browser
  Scenario: Create project
    Given a browser
    Then I create project "BDD-01" if necessary

  @persist_browser
  Scenario Outline: Launch all featured images
    Given a browser
      # Launch instance
    When I go to "/application/images"
    Then I should see "SEARCH" within 10 seconds
    And I should see an element with the css selector ".form-control" within 10 seconds
    When I type slowly "<image-guid>" to "0" index of class "form-control"
    Then I should see "<image-name>" within 20 seconds
    When I press "<image-name>"
    Then I should see an element with the css selector ".launch-button" within 10 seconds
    And element with xpath "//button[contains(@class, 'launch-button')]" should be enabled within 5 seconds
    When I press the element with xpath "//button[contains(@class, 'launch-button')]"
    And I should see "Launch an Instance / Basic Options" within 10 seconds
    And I should see "alloted GBs of Memory" within 10 seconds
    When I choose "<provider>" from "provider"
    And I pause the tests
#    And I choose "BDD-01" from Project dropdown
    And I choose "BDD-01" from "project"
      # This button sometimes gives trouble
    And I press "Launch Instance"
    And I wait for 3 seconds
    And I double-check that I press "Launch Instance"
    Then I should see "Build" within 60 seconds

    Examples: Selected images
      | image-guid                           | image-name                     | provider         |
#      | 30f31162-2a7a-4ac5-be1a-45c7e579a04b | Ubuntu 14.04.3 Development GUI | Jetstream - Indiana University |
      | 30f31162-2a7a-4ac5-be1a-45c7e579a04b | Ubuntu 14.04.3 Development GUI | Jetstream - TACC |


#Ubuntu 14.04.3 Development GUI - 30f31162-2a7a-4ac5-be1a-45c7e579a04b (version 1.3)


#Centos 7 (7.2) Development GUI - 4c2f0709-00e5-49bc-bcbf-e452862854a1
##* Ongoing issues with VNC installation on this image -- Do not use vnc*
#CentOS 7 R with Intel compilers - 78e1499d-cc9a-4453-9749-785ae7653010
##REQUIRES a m1.small or larger VM to launch
#CentOS 6 (6.8) Development GUI - 2f000dc6-b6f4-448d-9ed3-dea04c54f41f
#BioLinux 8 - b40b2ef5-23e9-4305-8372-35e891e55fc5
