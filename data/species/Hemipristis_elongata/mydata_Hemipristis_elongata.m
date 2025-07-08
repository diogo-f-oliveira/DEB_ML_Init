function [data, auxData, metaData, txtData, weights] = mydata_Hemipristis_elongata

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Carcharhiniformes'; 
metaData.family     = 'Hemigaleidae';
metaData.species    = 'Hemipristis_elongata'; 
metaData.species_en = 'Snaggletooth shark'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MINE','MPW'};
metaData.ecoCode.habitat = {'0iMcd'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.9); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm  = [2020 10 22];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 10 22];


%% set data
% zero-variate data

data.ab = 7.5*30.5;    units.ab = 'd';    label.ab = 'age at birth';          bibkey.ab = 'fishbase';   
  temp.ab = C2K(27.9); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '7-8 mnth';
data.am = 15*365;    units.am = 'd';    label.am = 'life span';          bibkey.am = 'fishbase';   
  temp.am = C2K(27.9); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 49;       units.Lb  = 'cm';  label.Lb  = 'total length at birth'; bibkey.Lb  = 'fishbase';  
  comment.Lb = '45-52 cm';
data.Lp  = 120;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females';  bibkey.Lp  = 'fishbase'; 
data.Li  = 240;      units.Li  = 'cm';  label.Li  = 'ultimate total length for females';    bibkey.Li  = 'fishbase';

data.Wwi = 72e3;units.Wwi = 'g';   label.Wwi = 'ultimate wet weight (female)';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00355*Li^3.07, see F1';

data.Ri  = 9/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';      bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(27.9); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2 till 11 pups per litter, 1 litter each yr, possibly each 2 yrs';

% uni-variate data
 
% time - length
data.tL = [ ... % time since birth (yr), total length (cm)
0.000	39.945
0.000	51.707
0.000	46.209
0.000	59.539
0.910	61.824
0.951	73.586
0.960	90.056
0.981	66.525
1.022	77.502
1.024	82.208
1.953	86.056
2.027	95.462
2.031	102.521
2.034	107.226
2.038	115.853
2.990	100.093
2.992	103.230
2.995	108.720
2.999	114.994
3.003	122.052
3.076	129.890
3.080	136.948
3.968	131.388
3.972	137.663
4.024	107.855
4.048	150.206
4.078	143.144
4.100	121.966
5.022	114.051
5.040	144.638
5.042	149.343
5.070	138.361
5.096	122.673
5.116	157.965
5.918	121.824
6.000	144.562
6.011	164.169
6.028	132.795
6.042	157.892
7.019	126.443
7.062	142.126
7.066	148.400
7.069	153.890
7.115	175.063
7.983	133.426
8.096	150.672
8.099	155.378
9.015	137.267
9.095	158.437
9.133	163.924
10.025	164.639
10.080	140.321
11.059	172.401
11.078	145.733
12.074	148.792
12.092	178.594
13.054	182.440
14.086	187.065];
data.tL(:,1) = data.tL(:,1) * 365; % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(27.9);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL  = 'SmarHarr2013';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Temperatures are guessed';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww in g  = 0.00355 * (TL in cm)^3.07';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'viviparous';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '3KRYJ'; % Cat of Life
metaData.links.id_ITIS = '160589'; % ITIS
metaData.links.id_EoL = '46559852'; % Ency of Life
metaData.links.id_Wiki = 'Hemipristis_elongata'; % Wikipedia
metaData.links.id_ADW = 'Hemipristis_elongata'; % ADW
metaData.links.id_Taxo = '176421'; % Taxonomicon
metaData.links.id_WoRMS = '277427'; % WoRMS
metaData.links.id_fishbase = 'Hemipristis-elongata'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Hemipristis_elongata}}';
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
bibkey = 'SmarHarr2013'; type = 'Article'; bib = [ ... 
'doi = {10.1002/aqc.2274}, ' ...
'author = {Jonathan J. Smart and Alastair V. Harry and Andrew J. Tobin and Colin A. Simpfendorfer}, ' ... 
'year = {2013}, ' ...
'title = {Overcoming the constraints of low sample sizes to produce age and growth data for rare or threatened sharks}, ' ...
'journal = {Aquatic Conserv: Mar. Freshw. Ecosyst.}, ' ...
'volume = {23}, ' ...
'pages = {124-134}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Hemipristis-elongata.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

