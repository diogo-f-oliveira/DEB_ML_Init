function [data, auxData, metaData, txtData, weights] = mydata_Triops_longicaudatus

%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Branchiopoda'; 
metaData.order      = 'Notostraca'; 
metaData.family     = 'Triopsidae';
metaData.species    = 'Triops_longicaudatus'; 
metaData.species_en = 'Longtail tadpole shrimp'; 

metaData.ecoCode.climate = {'B'};
metaData.ecoCode.ecozone = {'THn','TN','TPi','TA','TO'};
metaData.ecoCode.habitat = {'0iFpe'};
metaData.ecoCode.embryo  = {'Fs'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biD','biHa','biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Apf'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'; 'Ni_f'}; 
metaData.data_1     = {'t-L_f'}; 

metaData.COMPLETE = 3.0; % using criteria of LikaKear2011

metaData.author   = {'Peter Arisz','Bas Kooijman'};    
metaData.date_subm = [2013 04 22];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Peter Arisz','Bas Kooijman'};    
metaData.date_mod_1     = [2016 10 30];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 10 30]; 

%% set data
% zero-variate data

data.ab = 0.8; units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'Aris2013';   
  temp.ab = C2K(22);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 7.5-0.8; units.tp = 'd'; label.tp = 'time since birth at puberty'; bibkey.tp = 'SuMull2001';   
  temp.tp = C2K(29);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 40;  units.am = 'd';    label.am = 'life span';                   bibkey.am = 'SuMull2001';   
  temp.am = C2K(29);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'Wiki gives 90 d';
  
data.Lb  = 0.0944;  units.Lb  = 'cm';  label.Lb  = 'total length at birth'; bibkey.Lb  = 'Aris2013';
data.Lb_CL  = 0.25; units.Lb_CL  = 'cm';  label.Lb_CL  = 'carinal length at birth';   bibkey.Lb_CL  = 'SuMull2001';
data.Lp_CL  = 0.6;  units.Lp_CL  = 'cm';  label.Lp_CL  = 'carinal length at puberty'; bibkey.Lp_CL  = 'SuMull2001';
data.Li  = 3.1; units.Li  = 'cm';  label.Li  = 'ultimate total length';     bibkey.Li  = 'Wiki';

data.Wwi = 0.555;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'Wiki';

data.Ri  = 22;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';      bibkey.Ri  = 'killipark';   
  temp.Ri = C2K(22);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

data.N7  = 1100;   units.N7  = '#'; label.N7  = 'cum reprod at death';      bibkey.N7  = 'SuMull2001';   
  temp.N7 = C2K(29);  units.temp.N7 = 'K'; label.temp.N7 = 'temperature';
  comment.N7 = 'Corresponds to tL_7 data';
data.N1  = 50;   units.N1  = '#'; label.N1  = 'cum reprod at death';        bibkey.N1  = 'SuMull2001';   
  temp.N1 = C2K(29);  units.temp.N1 = 'K'; label.temp.N1 = 'temperature';
  comment.N1 = 'Corresponds to tL_1 data';
  
% uni-variate data
% t-L data
data.tL = [ ... % cm, total length at f and T
   0 0.0944
   3 0.42
   4 0.52
   5 0.78
   7 1.73
   9 2.18
  12 2.83
  14 3.06
  16 3.28 
  18 3.09
  19 3.12
  20 3.11
  21 3.09]; 
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(25);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Aris2013';
  
% t-CL data from SuMull2001 at 29 C
data.tL_7 = [ ... % time since hydration (d), carinal length (cm)
5.046	0.202
6.015	0.425
7.077	0.566
8.046	0.653
9.062	0.692
10.077	0.775
11.046	0.796
12.015	0.824
13.031	0.841
14.046	0.843
15.062	0.847
15.985	0.853
16.954	0.874
17.969	0.915
18.938	0.923
19.954	0.944
21.015	0.952
21.985	0.935
23.046	0.966
24.015	0.974
24.938	1.014
26.046	1.016
27.062	1.013
27.938	1.028
28.954	1.055
29.969	1.077
30.985	1.077
31.908	1.077
33.015	1.075
33.938	1.085
34.908	1.085
35.969	1.095
37.031	1.097
37.954	1.095
39.015	1.097
39.938	1.099
41.046	1.097
41.969	1.097
42.938	1.096
43.954	1.096
44.969	1.096
46.031	1.098];
units.tL_7   = {'d', 'cm'};  label.tL_7 = {'time since hydration', 'carinal length'};  
temp.tL_7    = C2K(29);  units.temp.tL_7 = 'K'; label.temp.tL_7 = 'temperature';
bibkey.tL_7 = 'SuMull2001';
comment.tL_7 = [ ...
  'carinal: snout till carinal suture, which divides the carapace along the longitudinal body axis (Tietze and Mulla 1989). '...
  'feeding regime 7 for 15 shrimps in 1 l: one time supplement of 200g soil, 20 live mosquito larvae plus 0.5 g rabbit pellets every other day (soil plus mosquito larvae and rabbit pellets). ' ...
  'Ultimate size is comparable with the natural populations from the flooded ponds at the Aquatic and Vector Control Research Facility, University of California at Riverside and with those from the natural habitats in the Coachella Valley, southern California. ' ...
  'Total length at 12 h after hatch is TL = 0.479 cm, 48 h TL = 0.719 cm'];

data.tL_1 = [ ... % time since hydration (d), carinal length (cm)
5.046	0.202
5.969	0.282
6.985	0.318
8.046	0.361
9.015	0.450
10.077	0.491
11.092	0.526
12.015	0.551
13.031	0.547
14.000	0.559
14.969	0.557
16.031	0.577
17.000	0.557
17.923	0.559
19.077	0.571
20.000	0.546
21.108	0.571
22.031	0.558
23.046	0.573
23.969	0.560];
units.tL_1   = {'d', 'cm'};  label.tL_1 = {'time since hydration', 'carinal length'};  
temp.tL_1    = C2K(29);  units.temp.tL_1 = 'K'; label.temp.tL_1 = 'temperature';
bibkey.tL_1 = 'SuMull2001';
comment.tL_1 = 'feeding rigime 1: one time supplement of 200 g soil alone placed in the bottom of each rearing pan (soil alone),';


%% set weights for all real data
weights = setweights(data, []);
weights.tL_7 = 10 * weights.tL_7;
weights.tL_1 = 10 * weights.tL_1;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_7','tL_1'}; subtitle1 = {'SuMull2001 data for feeding regime 7, 1'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Bas Kooijman: not sure that Lb_CL is at hatch';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'commonly parthenogenetic; dry egg may be in diapauze till 20 yr';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '58WLQ'; % Cat of Life
metaData.links.id_ITIS = '83766'; % ITIS
metaData.links.id_EoL = '338945'; % Ency of Life
metaData.links.id_Wiki = 'Triops_longicaudatus'; % Wikipedia
metaData.links.id_ADW = 'Triops_longicaudatus'; % ADW
metaData.links.id_Taxo = '622162'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Triops_longicaudatus}}';
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
bibkey = 'SuMull2001'; type = 'Article'; bib = [ ... 
'author = {Su, T. and Mulla, M. S.}, ' ... 
'year = {2001}, ' ...
'title = {Effects of nutritional factors and soil addition on growth, longevity and fecundity of the tadpole shrimp \emph{Triops newberryi} ({N}otostraca: {T}ripsidae), a potential biological control agent of immature mosquitoes}, ' ...
'howpublished = {\url{http://www.sove.org/Society_for_Vector_Ecology/Journal/Entries/2001/6/1_Volume_26,_Number_1_files/su1.pdf}}, ' ...
'journal = {Journal for Vector Ecology}, ' ...
'volume = {26}, ' ...
'pages = {43--50}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'killipark'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.killipark.com/triops-longicaudatus-5000-eggs-100-capsule-free-shipping-to-worldwide/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Aris2013'; type = 'Misc'; bib = [ ...
'author = {Peter Arisz}, ' ... 
'year = {2013}, ' ...
'note = {Original data}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

