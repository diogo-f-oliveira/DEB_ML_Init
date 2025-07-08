function [data, auxData, metaData, txtData, weights] = mydata_Leptomysis_lingvura

%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Malacostraca'; 
metaData.order      = 'Mysida'; 
metaData.family     = 'Mysidae';
metaData.species    = 'Leptomysis_lingvura'; 
metaData.species_en = 'Opossum shrimp'; 

metaData.ecoCode.climate = {'MB', 'MC'};
metaData.ecoCode.ecozone = {'MANE', 'MAm'};
metaData.ecoCode.habitat = {'0iMpe', '0iMi'};
metaData.ecoCode.embryo  = {'Mbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wdb'; 'Wdp'; 'Wdi'; 'Ri'}; 
metaData.data_1     = {'t-L_T'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2017 09 28];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 09 28]; 

%% set data
% zero-variate data

data.ab = 17;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'guess';   
  temp.ab = C2K(18);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'guess based on Hemimysis speluncola';
data.tp = 41;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';
  temp.tp = C2K(18);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'based on tL-curve at 18 C for Lp';
data.am = 365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(15);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.165;   units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'GaudGuer1979';  
data.Lp  = 0.485;   units.Lp  = 'cm';  label.Lp  = 'length at puberty'; bibkey.Lp  = 'guess'; 
  comment.Lp = 'guess based on same relative length compared to Praunus: 1.8/2.6*0.7';
data.Li  = 0.7;   units.Li  = 'cm';  label.Li  = 'ultimate length';   bibkey.Li  = 'GaudGuer1979';

data.Wdb = 9.62e-6;   units.Wdb = 'g';   label.Wdb = 'dry weight at birth';     bibkey.Wdb = 'guess';
  comment.Wdb = 'based on (Lb/Li)^3*Wdi';
data.Wdp = 2.44e-4;   units.Wdp = 'g';   label.Wdp = 'dry weight at puberty';   bibkey.Wdp = 'guess';
  comment.Wdp = 'based on (Lp/Li)^3*Wdi';
data.Wdi = 7.34e-4;   units.Wdi = 'g';   label.Wdi = 'ultimate dry weight';     bibkey.Wdi = 'guess';
  comment.Wdi = 'based on length-weight of Mysis mixta: (0.7/1.470)^3*6.8e-3';
 
data.Ri  = 0.35;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'guess';   
  temp.Ri = C2K(10);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'guess based on kap = 0.9';
  
% uni-variate data
% t-L data
data.tL_10 = [ ... % time since Jan 1 (d), standard length (cm)
7.993	0.179
9.473	0.182
14.161	0.211
17.958	0.216
21.822	0.254
27.729	0.262
34.289	0.280
39.363	0.292
45.066	0.304
48.452	0.314
52.052	0.325
53.741	0.328
61.202	0.375
64.802	0.386
68.405	0.399
71.350	0.399
72.837	0.407
74.730	0.407];  
data.tL_10(:,1) = data.tL_10(:,1) - data.tL_10(1,1); % convert time to time since birth
units.tL_10   = {'d', 'cm'};  label.tL_10 = {'time since birth', 'total length', '10 C'};  
temp.tL_10    = C2K(10);  units.temp.tL_10 = 'K'; label.temp.tL_10 = 'temperature';
bibkey.tL_10 = 'GaudGuer1979';
%
data.tL_14 = [ ... % time since Jan 1 (d), standard length (cm)
53.517	0.213
56.504	0.259
60.100	0.270
62.439	0.293
66.665	0.299
70.070	0.340
71.758	0.340
76.432	0.382
79.198	0.413
83.849	0.425
89.792	0.470
91.705	0.490];  
data.tL_14(:,1) = data.tL_14(:,1) - data.tL_14(1,1); % convert time to time since birth
units.tL_14   = {'d', 'cm'};  label.tL_14 = {'time since birth', 'total length', '14 C'};  
temp.tL_14    = C2K(14);  units.temp.tL_14 = 'K'; label.temp.tL_14 = 'temperature';
bibkey.tL_14 = 'GaudGuer1979';
%
data.tL_18 = [ ... % time since Jan 1 (d), standard length (cm)
6.887	0.225
7.871	0.234
8.855	0.237
9.839	0.254
10.823	0.266
12.544	0.266
14.758	0.318
16.726	0.318
18.694	0.356
20.661	0.356
24.351	0.387
27.794	0.389
30.992	0.418
42.060	0.449
47.718	0.508
52.637	0.542
57.065	0.581
61.000	0.632
62.968	0.653
70.839	0.661
72.315	0.685
74.036	0.688
79.202	0.687];  
data.tL_18(:,1) = data.tL_18(:,1) - data.tL_18(1,1); % convert time to time since birth
units.tL_18   = {'d', 'cm'};  label.tL_18 = {'time since birth', 'total length', '18 C'};  
temp.tL_18    = C2K(18);  units.temp.tL_18 = 'K'; label.temp.tL_18 = 'temperature';
bibkey.tL_18 = 'GaudGuer1979';
%
data.tL_22 = [ ... % time since Jan 1 (d), standard length (cm)
5.703	0.210
7.935	0.257
9.423	0.301
12.398	0.347
14.382	0.371
18.350	0.387
20.829	0.430
24.301	0.431
27.772	0.431];  
data.tL_22(:,1) = data.tL_22(:,1) - data.tL_22(1,1); % convert time to time since birth
units.tL_22   = {'d', 'cm'};  label.tL_22 = {'time since birth', 'total length', '22 C'};  
temp.tL_22    = C2K(22);  units.temp.tL_22 = 'K'; label.temp.tL_22 = 'temperature';
bibkey.tL_22 = 'GaudGuer1979';

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
set1 = {'tL_22','tL_18','tL_14','tL_10'}; subtitle1 = {'Data for 22, 18, 14, 10 C'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Facts
F1 = 'Females release eggs into a brood pouch or marsupium, where they are held until they hatch';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3TRQT'; % Cat of Life
metaData.links.id_ITIS = '90683'; % ITIS
metaData.links.id_EoL = '46531542'; % Ency of Life
metaData.links.id_Wiki = ''; % Wikipedia
metaData.links.id_ADW = 'Leptomysis_lingvura'; % ADW
metaData.links.id_Taxo = '438848'; % Taxonomicon
metaData.links.id_WoRMS = '120054'; % WoRMS


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Mysidae}}';
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
bibkey = 'GaudGuer1979'; type = 'Article'; bib = [ ... 
'author = {R. Gaudy and J. P. Guerin}, ' ... 
'year = {1979}, ' ...
'title = {Ecophysiologie comparee des mysidaces \emph{Hemimysis speluncola} {L}edoyer ({C}arvernicole) at \emph{Leptomysis lingvura} {G}. {O}. {S}ars (non cavernicole). {A}ction de la temperature sur la croissance en elevage}, ' ...
'journal = {J. exp. mar. Biol. Ecol.}, ' ...
'volume = {38}, ' ...
'pages = {101-119}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
