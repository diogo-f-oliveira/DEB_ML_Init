function [data, auxData, metaData, txtData, weights] = mydata_Mesocentrotus_franciscanus

%% set metaData
metaData.phylum     = 'Echinodermata'; 
metaData.class      = 'Echinoidea'; 
metaData.order      = 'Camarodonta'; 
metaData.family     = 'Strongylocentrotidae';
metaData.species    = 'Mesocentrotus_franciscanus'; 
metaData.species_en = 'Red sea urchin'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPE'};
metaData.ecoCode.habitat = {'0jMcp', 'jiMb', 'jiMi'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biP', 'bjHa', 'bjCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(16); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'; 'L-Ww'; 'L-R';'L-dL'; 'Ww-JO'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2017 02 15];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1= {'Romina Barbosa'};    
metaData.date_subm_1 = [2023 06 04];              
metaData.email_1    = {'rominavanessa.barbosa@gmail.com'};            
metaData.address_1  = {'UVic University of Victoria'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 18]; 

%% set data
% zero-variate data

data.tp = 2*365;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'ADW';
  temp.tp = C2K(12);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'temp based on optimal feeding at 16 C';
data.am = 50*365;  units.am = 'd';    label.am = 'life span';                   bibkey.am = 'Wiki';   
  temp.am = C2K(16);  units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'over 30 yr, even 200 yr have been found';

data.Lj  = 0.5; units.Lj  = 'cm';  label.Lj  = 'test diameter at settlement';   bibkey.Lj  = 'asnailsodyssey';
data.Lp  = 3.5;   units.Lp  = 'cm';  label.Lp  = 'test diameter at puberty';   bibkey.Lp  = 'ADW'; %changed 5 to 3.5--> guess based on observatin of gonad
data.Li  = 19;  units.Li  = 'cm';  label.Li  = 'ultimate test diameter';     bibkey.Li  = 'Wiki';

data.Wwb = 2e-6;    units.Wwb = 'g';   label.Wwb = 'wet weight at birth';        bibkey.Wwb = 'guess';
data.Wwi = 2e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';        bibkey.Wwi = 'Wiki';
comment.Wwi = 'Based on volume cylinder with diameter 19 cm and height 7 cm: pi*9.5^2*7';

data.GSI = 0.21;  units.GSI = ''; label.GSI = 'gonadal somatic index';   bibkey.GSI = {'Bern2011','McBrPinn1997'};
  temp.GSI = C2K(12); units.temp.GSI = 'K'; label.temp.GSI = 'temperature'; 
  comment.GSI = 'average between 0.22 Bern2011 and 0.20 McBride et al 1997)';

% uni-variate data

% time-length
data.tL = readmatrix('tL.txt'); % time since settlement (yr), test diameter (cm)
data.tL(:,1) = data.tL(:,1) * 365; % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since settlement', 'test diameter'};  
temp.tL    = C2K(13);  units.temp.tL = 'K'; label.temp.tL = 'temperature';  %change guess of temperature from 16 to 13 (Romina)
bibkey.tL = 'ShelWood2006';
comment.tL = 'temp is guessed';

% length-change in length for tagued individuals after one year in the field   
data.LdL =  readmatrix("LdL.txt"); % test diameter (mm), change in test diameter (mm)
data.LdL(:,2) = data.LdL(:,2)./365 ;
data.LdL = data.LdL./ 10; % mm to cm (notice the dot before the divide that is element by element division so both columns divided by 10)
units.LdL   = {'cm', 'cm'};  label.LdL = {'test length', 'change in test length'};  
temp.LdL    = C2K(11);  units.temp.LdL = 'K'; label.temp.LdL = 'temperature';
bibkey.LdL = 'RogeRoge2003';
comment.LdL = ['temperature is guessed; test diameter calculted from jaw length using allometric function' ...
    '(D = 3.31 J^1.15; r2=0.989, df=382) by Rogers-Bennett et al. 2003' ...
    'One year - ind were tagged at Salt Point on 19 August 1992, Urchins were recaptured from the Salt Point sites on 18 September 1993 (n=374 shallow; n=352 deep'];

% wet weight- dioxygen consumption data; individuals collected in 3 kelp field habitats
data.WwJO1 = readmatrix('WwJO1.txt');  % mgO2/h, O2 consumption rate of individuals living on kelp habitat (~2 m below mean water depth)
data.WwJO1 = sortrows(data.WwJO1);
units.WwJO1 = {'g', 'mg/h'}; label.WwJO1 = {'total wet weight', 'O_2 consumption rate'}; bibkey.WwJO1 = 'SpinLee2021';
temp.WwJO1    = C2K(12);  units.temp.WwJO1 = 'K'; label.temp.WwJO1 = 'temperature';
comment.WwJO1 = ['Mean O2 consumption: measured respiration rates after a 48-h period of starvation post-collection from the wild, at ~ 2 m below mean low water, in 2019.' ...
 'Surge Narrows (50.22 N, 125.16 W) between Quadra and Maurelle Islands.; temperature is average between both sites in July'];
%
data.WwJO2 = [ ... 
26	0.951435038
57	2.086578635
58	1.82891809
70	2.582824757
88	2.491942415
118	4.54016007
128	4.153733371
188	3.703391346
194	3.309209269
194.001	5.905576594
247	5.939221178
327	7.088126807
405	9.079596046
414	8.463748597
560	12.68492377];  % mgO2/h, O2 consumption rate of individuals living on kelp habitat (~2 m below mean water depth)
units.WwJO2 = {'g', 'mg/h'}; label.WwJO2 = {'total wet weight', 'O_2 consumption rate'}; bibkey.WwJO2 = 'SpinLee2021';
temp.WwJO2    = C2K(11);  units.temp.WwJO2 = 'K'; label.temp.WwJO2 = 'temperature';
comment.WwJO2 = 'Faraday (52.61 N, 131.49 W)';
%
data.WwJO3 = [ ... 
38	0.616546147
51	1.411304708
54	2.263366791
55	2.453722821
55.001	2.570924099
56	1.436569784
61	1.639303344
63	2.068358591
65	2.553041014
70	2.53998966
78	3.231739586
79	1.812564028
89	2.440166836
92	4.430673035
95	3.288014436];  % mgO2/h, O2 consumption rate of individuals living on kelp habitat (~2 m below mean water depth)
units.WwJO3 = {'g', 'mg/h'}; label.WwJO3 = {'total wet weight', 'O_2 consumption rate'}; bibkey.WwJO3 = 'SpinLee2021';
temp.WwJO3    = C2K(11);  units.temp.WwJO3 = 'K'; label.temp.WwJO3 = 'temperature';
comment.WwJO3 = 'Murchison (52.60 N, 131.45 W) in Gwaii Haanas on Haida Gwaii';

% test diameter - total wet weight
data.LW1 = readmatrix('LW1'); % test diameter (mm); animal wet weight (g)
data.LW1(:,1) = data.LW1(:,1)/10; % convert mm to cm We work in SI
units.LW1   = {'cm', 'g'};  label.LW1 = {'test diameter', 'animal wet weight'};  
bibkey.LW1 = 'SpinLee2021';
comment.LW1 = 'Surge Narrows (50.22 N, 125.16 W) between Quadra and Maurelle Islands.';
%
data.LW2 = [ ... test diameter (mm); animal wet weight (g)
44	26
56	58
56	57
63	70
67	88
76	128
81	188
81	118
88	194
89	194
96	247
121	414
122	327
123	405
133	560];
data.LW2(:,1) = data.LW2(:,1)/10; % convert mm to cm We work in SI
units.LW2   = {'cm', 'g'};  label.LW2 = {'test diameter', 'animal wet weight'};  
bibkey.LW2 = 'SpinLee2021';
comment.LW2 = 'Faraday (52.61 N, 131.49 W)';
%
data.LW3 = [ ... test diameter (mm); animal wet weight (g)
38	20
51	36
54	47
55	49
55	50
56	50
61	67
63	77
65	87
70	103
78	146
79	86
89	129
92	203
95	189];
data.LW3(:,1) = data.LW3(:,1)/10; % convert mm to cm We work in SI
units.LW3   = {'cm', 'g'};  label.LW3 = {'test diameter', 'animal wet weight'};  
bibkey.LW3 = 'SpinLee2021';
comment.LW3 = 'Murchison (52.60 N, 131.45 W) in Gwaii Haanas on Haida Gwaii';
 
% length gonad-weight
data.LR1 = readmatrix('LR1.txt'); % test diameter (mm), gonad weight (g)
%
data.LR2 = [ ... % test diameter (mm), gonad weight (g)
44	0.5
56	6.5
56	5
63	3
67	5
76	11
81	27.5
81.001	9
88	21
89	16.5
96	28
121	49.5
122	22
123	26.5
133	89];

data.LR3 = [ ... % test diameter (mm), gonad weight (g)
38	2
51	4
54	7
55	3
55.001	3.5
56	4
61	4
63	9
65	13.5
70	13
78	10
79	11
89	5
92	28
95	15.5];


data.LR1(:,1) = data.LR1(:,1)/10; % convert mm to cm
units.LR1   = {'cm', 'g'};  label.LR1 = {'test diameter', 'gonad weight'};  
temp.LR1    = C2K(12);  units.temp.LR1 = 'K'; label.temp.LR1 = 'temperature';
bibkey.LR1 = 'SpinLee2021';
comment.LR1 = 'Site: Surge Narrows; temp is annual mean; I here assume yearly spawning, so the mean accumulation time is 365/2 d'; %comment from Gracilechinus_affinis (Kooijman model)

data.LR2(:,1) = data.LR2(:,1)/10; % convert mm to cm
units.LR2   = {'cm', 'g'};  label.LR2 = {'test diameter', 'gonad weight'};  
temp.LR2    = C2K(12);  units.temp.LR2 = 'K'; label.temp.LR2 = 'temperature';
bibkey.LR2 = 'SpinLee2021';
comment.LR2 = 'Site: Faraday; temp is annual mean; I here assume yearly spawning, so the mean accumulation time is 365/2 d'; %comment from Gracilechinus_affinis (Kooijman model)

data.LR3(:,1) = data.LR3(:,1)/10; % convert mm to cm
units.LR3   = {'cm', 'g'};  label.LR3 = {'test diameter', 'gonad weight'};  
temp.LR3    = C2K(12);  units.temp.LR3 = 'K'; label.temp.LR3 = 'temperature';
bibkey.LR3 = 'SpinLee2021';
comment.LR3 = 'Site: Murchison; temp is annual mean; I here assume yearly spawning, so the mean accumulation time is 365/2 d'; %comment from Gracilechinus_affinis (Kooijman model)

set0 = {'WwJO1','WwJO2', 'WwJO3'};
subtitle0 = {'total weight - O2 consumption rate from different sites'};

set1 = {'LW1','LW2', 'LW3'};
subtitle1 = {'Length - weight from different sites'};

set2 = {'LR1','LR2', 'LR3'};
subtitle2 = {'Gonad weight - test diameter from different sites'};

metaData.grp.sets = {set0, set1, set2};
metaData.grp.subtitle = {subtitle0, subtitle1, subtitle2};

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;
weights.tp = 5 * weights.tp;
weights.Lp = 5 * weights.Lp;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Weight at birth is guessed from Sterechinus which has Wd0 of 0.5 mug';
D2 = 'In view of low somatic maintenance, pseudodata k_J = 0.002 1/d is replaced by pseudodata k = 0.3';
D3 = 'mod_1: GSI because found information for the species (it was a guess in the original mod)';
D4 = 'mod_1: ldl added data from ; average annual water temperature 11C, ranges from 9.5°C (49°F) in April up to 12.9°C (55.1°F) in September, https://www.watertemperature.org/Salt-Point-State-Park-UnitedStates-Beach.html';
D5 = 'mod_1: LDw added data to model_1';
D6 = 'mod_1: WwJO added data to model_1';
D7 = 'mod_1: LWw added data to model_1; LWw, LDw, WwJO, and LR were measured for the same individuals (not all ind have all measurements)';
D8 = 'mod_1: L-R data assumes yearly spawning, so the mean accumulation time is 365/2 d';
metaData.discussion = struct('D1', D1, 'D2', D2, 'D3', D3, 'D4', D4, 'D5', D5, 'D6', D6, 'D7', D7, 'D8', D8);

%% Links
metaData.links.id_CoL = '42222'; % Cat of Life
metaData.links.id_ITIS = '157971'; % ITIS
metaData.links.id_EoL = '599671'; % Ency of Life
metaData.links.id_Wiki = 'Mesocentrotus_franciscanus'; % Wikipedia
metaData.links.id_ADW = 'Strongylocentrotus_franciscanus'; % ADW
metaData.links.id_Taxo = '3927130'; % Taxonomicon
metaData.links.id_WoRMS = '591102'; % WoRMS


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Mesocentrotus_franciscanus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'RogeRoge2003'; type = 'Article'; bib = [ ... 
'author = {Roger-Bennett, L. and Rogers, D. W. and Bennet, W. A. and Ebert, T. A.}, ' ... 
'year = {2003}, ' ...
'title = {Modeling red sea urchin (\emph{Strongylocentrotus franciscanus}) growth using six growth function}, ' ...
'journal = {Fish Bull.}, ' ...
'volume = {101}, ' ...
'pages = {614-626}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ShelWood2006'; type = 'Article'; bib = [ ... 
'author = {Shelton, A. O. and Woodby, D. A. and Hebert, K and Witman, J. D.}, ' ... 
'year = {2006}, ' ...
'title = {Evaluating age determination and spatial patterns of growth in red  sea  urchins  in  southeast  {A}laska}, ' ...
'journal = {Trans  Am.  Fish.  Soc.}, ' ...
'volume = {135}, ' ...
'pages = {1670-1680}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'asnailsodyssey'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.asnailsodyssey.com/LEARNABOUT/URCHIN/urchTest.php}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Strongylocentrotus_franciscanus/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SpinLee2021'; type = 'Article'; bib = [ ... 
'author = {Spindel, N. B. and Lee, L. C. and Okamoto, D. K.}, ' ... 
'year = {2021}, ' ...
'title = {Metabolic depression in sea urchin barrens associated with food deprivation}, ' ...
'journal = {Ecology}, ' ...
'volume = {102}, ' ...
'pages = {e03463}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Bern2011'; type = 'Article'; bib = [ ... 
'author = {F. R. Bernard}, ' ... 
'year = {2011}, ' ...
'title = {Fishery and Reproductive Cycle of the Red Sea Urchin, \emph{Strongylocentrotus franciscanus}, in {B}ritish {C}olumbia}, ' ...
'journal = {Journal of the Fisheries Research Board of Canada}, ' ...
'volume = {34}, ' ...
'number = {5}, ' ...
'doi = {10.1139/f77-095}, ' ...
'pages = {604--610}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'McBrPinn1997'; type = 'Article'; bib = [ ... 
'author = {McBride, S. C. and Pinnix, W. D. and Lawrence, J. M. and Lawrence, A. L. and Mulligan, T. M.}, ' ... 
'year = {1997}, ' ...
'title = {The Effect of Temperature on Production of Gonads by the Sea Urchin \emph{Strongylocentrotus franciscanus} Fed Natural and Prepared Diets}, ' ...
'journal = {Journal of the World Aquaculture Society}, ' ...
'volume = {28}, ' ...
'number = {4}, ' ...
'pages = {357--365}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
