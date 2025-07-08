function [data, auxData, metaData, txtData, weights] = mydata_Extatosoma_tiaratum 

%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Insecta'; 
metaData.order      = 'Phasmatodea'; 
metaData.family     = 'Phasmatidae';
metaData.species    = 'Extatosoma_tiaratum'; 
metaData.species_en = 'Spiny Leaf Insect'; 

metaData.ecoCode.climate = {'Cfa', 'Cfb'};
metaData.ecoCode.ecozone = {'TA'};
metaData.ecoCode.habitat = {'0iTh', '0iTf'};
metaData.ecoCode.embryo  = {'Tnp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biH'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Li'; 'Ww0'; 'Wwi'; 'Ri'; 'JC_L';};
metaData.data_1     = {'Ww-JC_T'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Nigel Andrew'};            
metaData.date_subm   = [2019 03 05];                   
metaData.email       = {'nigel.andrew@une.edu.au'};
metaData.address     = {'Natural History Museum, University of New England, Armidale, NSW, 2351, Australia'};
  
metaData.curator     = {'Bas Kooijman'};
metaData.email_cur   = {'bas.kooijman@vu.nl'}; 
metaData.date_acc    = [2019 04 17]; 

%% set data
% zero-variate data

data.ab = 27.6;      units.ab = 'd';    label.ab = 'mean time to commence ovipositing'; 
  temp.ab = C2K(20);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; bibkey.ab = 'SchnElga2010';   
  comment.ab  = 'mean time to commence ovipositing after sexual maturity'; 
data.tp = 180;     units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'Dodgy2017';
  temp.tp = C2K(20);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 500;     units.am = 'd';    label.am = 'life span'; bibkey.am = 'Dodgy2017';
  temp.am = C2K(20);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb = 1.5;     units.Lb = 'cm';    label.Lb = 'total length at birth';  bibkey.Lb = 'Dodgy2017'  ;
data.L1  = 4.8045; units.L1  = 'cm';   label.L1  = 'Length 1st instar';   bibkey.L1  = 'Andr2017';    
data.L2  = 9.114;  units.L2  = 'cm';   label.L2  = 'Length 2nd instar';  bibkey.L2  = 'Andr2017';
data.L3  = 11.575; units.L3  = 'cm';   label.L3  = 'Length 3rd instar';   bibkey.L3  = 'Andr2017';    
data.Li = 11.575;  units.Li = 'cm';    label.Li = 'total length of adult';  bibkey.Li = 'Andr2017'  ;

%data.Ww0 = 0.048; units.Ww0 = 'g';    label.Ww0 = 'egg weight (g)';         bibkey.Ww0 = 'SchnElga2010'; 
data.Wd0 = 30.6;   units.Wd0 = 'mg';   label.Wd0 = 'dry egg weight (g)';     bibkey.Wd0 = 'Andr2017'; 
data.Ww0 = 40.2;   units.Ww0 = 'mg';   label.Ww0 = 'wet egg weight (g)';     bibkey.Ww0 = 'Andr2017'; 
data.Ww1 = 689.3;  units.Ww1 = 'mg';   label.Ww1 = 'wet weight 1st instar'; bibkey.Ww1 = 'Andr2017';
  comment.Ww1 = 'Length 48.04 mm';
data.Ww2 = 6795.2;  units.Ww2 = 'mg';  label.Ww2 = 'wet weight 2nd instar'; bibkey.Ww2 = 'Andr2017';
  comment.Ww2 = 'Length 91.14 mm';
data.Ww3 = 13993.5;  units.Ww3 = 'mg'; label.Ww3 = 'wet weight 3th instar'; bibkey.Ww3 = 'Andr2017';
  comment.Ww3 = 'Length 11.575 cm';

data.Ri = 4;      units.Ri = '#/d';    label.Ri = 'mean number of eggs produced per day'; bibkey.Ri = 'SchnElga2010'; 
temp.Ri = C2K(20);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

data.JC1 = 0.001033321;      units.JC1  = 'ml/min'; label.JC1  = 'CO2 flux  1st instar';   bibkey.JC1  = 'Andr2017'; 
  temp.JC1 = C2K(25);  units.temp.JC1 = 'K'; label.temp.JC1 = 'temperature';
data.JC2 = 0.006525227;      units.JC2  = 'ml/min'; label.JC2  = 'CO2 flux  2nd instar';   bibkey.JC2  = 'Andr2017'; 
  temp.JC2 = C2K(25);  units.temp.JC2 = 'K'; label.temp.JC2 = 'temperature';
data.JC3 = 0.021754095;      units.JC3  = 'ml/min'; label.JC3  = 'CO2 flux  3th instar';   bibkey.JC3  = 'Andr2017'; 
  temp.JC3 = C2K(25);  units.temp.JC3 = 'K'; label.temp.JC3 = 'temperature';
data.JCi = 0.030701198;     units.JCi  = 'ml/min'; label.JCi  = 'CO2 production of adult'; bibkey.JCi  = 'Andr2017';    
  temp.JCi = C2K(25); units.temp.JCi = 'K'; label.temp.JCi = 'temperature';

% uni-variate data
% weight-CO2 production
data.WJC_25 = [... % wet weight (mg), CO2 prod (ml/min)
30.7	41.4	98.6	467.6	1578.9	2371	9624.5 % weight (mg)
1.28178e-06	7.90298e-06	0.000337763	0.001033321	0.006525227	0.002726335	0.021754095]'; % vCO2 ml/min
units.WJC_25  = {'mg', 'ml/min'};  label.WJC_25 = {'wet weight', 'CO_2 production', '25 C'};  
temp.WJC_25  = C2K(25);  units.temp.WJC_25 = 'C'; label.temp.WJC_25 = 'temperature';
bibkey.WJC_25 = 'Andr2017';
%
data.WJC_35 = [... % wet weight (mg), CO2 prod (ml/min)
30.7	42	99.3	466.2	1532.1	2371	9557 % weight (mg)
6.65161e-06	1.92416e-05	0.000555194	0.002000088	0.005564134	0.006573644	0.030701198]'; % vCO2 ml/min
units.WJC_35  = {'mg', 'ml/min'};  label.WJC_35 = {'wet weight', 'CO_2 production', '35 C'};  
temp.WJC_35  = C2K(35);  units.temp.WJC_35 = 'C'; label.temp.WJC_35 = 'temperature';
bibkey.WJC_35 = 'Andr2017';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'WJC_35','WJC_25'}; subtitle1 = {'CO2 production at 35, 25 C'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Links
metaData.links.id_CoL = '3DQMY'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '1078018'; % Ency of Life
metaData.links.id_Wiki = 'Extatosoma_tiaratum'; % Wikipedia
metaData.links.id_ADW = 'Extatosoma_tiaratum'; % ADW
metaData.links.id_Taxo = '18284'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_phasmida = '4439'; % phasmida

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Extatosoma_tiaratum}}';
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
bibkey = 'Andr2017'; type = 'Article'; bib = [ ... 
'author = {Andrew, N.}, ' ... 
'year = {2017}, ' ...
'title = {Insect Ecology Lab Data}, ' ...
'journal = {UNE}, ' ...
'volume = {1}, ' ...
'number = {a}, '...
'pages = {001-003}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SchnElga2010'; type = 'Article'; bib = [ ... 
'author = {Angela Schneider and Mark A. Elgar}, ' ... 
'year = {2010}, ' ...
'title = {Facultative sex and reproductive strategies in response to male availability in the spiny stick insect, \emph{Extatosoma tiaratum}}, ' ...
'journal = {Australian Journal of Zoology}, ' ...
'volume = {58}, ' ...
'pages = {228-233}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

