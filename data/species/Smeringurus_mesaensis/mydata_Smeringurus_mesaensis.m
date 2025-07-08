function [data, auxData, metaData, txtData, weights] = mydata_Smeringurus_mesaensis

%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Arachnida'; 
metaData.order      = 'Scorpiones'; 
metaData.family     = 'Vaejovidae';
metaData.species    = 'Smeringurus_mesaensis'; 
metaData.species_en = 'Desert sand scorpion';

metaData.ecoCode.climate = {'BW'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0jTd'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri';}; 
metaData.data_1     = {'t-Ww'; 't-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2012 12 18];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2016 01 08];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};  

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2     = [2023 03 29];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 03 29];

%% set data
% zero-variate data

data.ab = 365; units.ab = 'd';       label.ab = 'age at birth';             bibkey.ab = 'Poli1990';   
  temp.ab = C2K(25); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 21.5*30.5; units.tp = 'd'; label.tp = 'time since birth at puberty'; bibkey.tp = 'Poli1990';
  temp.tp = C2K(25);   units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 70 * 30.5; units.am = 'd'; label.am = 'life span';                bibkey.am = 'Poli1990';   
  temp.am = C2K(25);   units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 1.6;   units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'Poli1990';
data.Lp  = 6.3;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'Poli1990';
data.Li  = 6.9;   units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'Poli1990';

data.Wwb = 0.013; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Poli1990';
data.Wwp = 1.6;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'Poli1990';
data.Wwi = 2.2;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Poli1990';

data.Ri  = 23/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'Poli1990';   
  temp.Ri = C2K(25);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-length
data.tL_f = [ ... % time since birth (d), total length (cm)
0    	1.581
33.612	1.740
63.490	1.786
246.490	3.055
298.776	2.898
341.724	3.487
394.010	3.691
429.490	4.279
547.133	4.734
578.878	5.006
610.622	4.916
642.367	5.143
681.582	5.844
700.255	6.002
735.735	6.320
976.623	7.906
1101.735 6.869];
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'length', 'female'};  
temp.tL_f    = C2K(25);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Poli1990';
comment.tL_f = 'Poli1990, Fig 4.13 p 102';
%
data.tL_m = [ ... time since birth (d), total length (cm)
0   	1.482
27.294	1.591
58.333	1.831
241.815	2.594
294.637	3.095
336.206	3.728
391.808	3.553
425.996	4.185
536.326	4.469
570.906	4.817
607.662	4.926
634.679	5.406
670.863	5.929
692.585	6.234
726.531	7.041
970.880	7.826];
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'length', 'male'};  
temp.tL_m    = C2K(25);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Poli1990';
comment.tL_m = 'Poli1990, Fig 4.13 p 102';

% time-weight
data.tW_f = [ ... % time since birth (d), wet weight (g)
0    	0.019
33.612	0.039
61.622	0.039
89.633	0.039
246.490	0.181
298.776	0.220
343.592	0.297
392.143	0.323
429.490	0.515
543.398	0.707
575.143	0.847
610.622	0.988
640.500	1.027
675.980	1.473
702.123	1.588
730.133	1.652
976.623	3.680
1099.867	2.166];
units.tW_f   = {'d', 'g'};  label.tW_f = {'time since birth', 'wet weight', 'female'};  
temp.tW_f    = C2K(25);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'Poli1990';
%
data.tW_m = [ ... time since birth (d), wet weight (g)
0   	0.019
90.480	0.049
247.428	0.148
301.058	0.271
339.879	0.345
397.017	0.271
432.284	0.492
548.645	0.603
576.507	0.800
615.476	1.034
643.259	1.145
678.582	1.428
702.618	1.477
734.307	1.822
982.394	2.695];
units.tW_m   = {'d', 'g'};  label.tW_m = {'time since birth', 'wet weight', 'male'};  
temp.tW_m    = C2K(25);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'Poli1990';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tW_f(16) = 0; % exclude point with eggs

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for female, male'};
set2 = {'tW_f','tW_m'}; subtitle2 = {'Data for female, male'};
metaData.grp.sets = {set1, set2};
metaData.grp.subtitle = {subtitle1, subtitle2};

%% Discussion points
D1 = 'Males are asummed to differ from females by {p_Am} only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = '4XVK4'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '3195557'; % Ency of Life
metaData.links.id_Wiki = 'Smeringurus_mesaensis'; % Wikipedia
metaData.links.id_ADW = 'Smeringurus_mesaensis'; % ADW
metaData.links.id_Taxo = '5671203'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_scorpion = 'vaejovidae.php'; % scorpion

%% References
bibkey = 'revsys'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.vaejovidae.com/Genus~Smeringurus.htm}}';
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
bibkey = 'Poli1990'; type = 'Book'; bib = [ ... 
'author = {Polis, G. A.}, ' ... 
'year = {1990}, ' ...
'title = {The biology of scorpions}, ' ...
'publisher = {Stanford University Press}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

