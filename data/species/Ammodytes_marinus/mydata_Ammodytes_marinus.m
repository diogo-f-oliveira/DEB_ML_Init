function [data, auxData, metaData, txtData, weights] = mydata_Ammodytes_marinus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Uranoscopiformes'; 
metaData.family     = 'Ammodytidae';
metaData.species    = 'Ammodytes_marinus'; 
metaData.species_en = 'Raitt''s sand eel'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MAN'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(9); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Ri'}; 
metaData.data_1     = {'t-L_f'; 't-Ww_f'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 03 14];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 03 14];

%% set data
% zero-variate data

data.ab11 = 19;  units.ab11 = 'd';    label.ab11 = 'age at birth';                bibkey.ab11 = 'RegnGibb2018';   
  temp.ab11 = C2K(11);  units.temp.ab11 = 'K'; label.temp.ab11 = 'temperature'; 
data.ab06 = 36;  units.ab06 = 'd';    label.ab06 = 'age at birth';                bibkey.ab06 = 'RegnGibb2018';   
  temp.ab06 = C2K(6);  units.temp.ab06 = 'K'; label.temp.ab06 = 'temperature'; 
data.am = 10*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'fishbase';   
  temp.am = C2K(9);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 11;  units.Lp  = 'cm';  label.Lp  = 'standard length at puberty'; bibkey.Lp  = 'fishbase'; 
data.Li  = 25;  units.Li  = 'cm';  label.Li  = 'ultimate standard length'; bibkey.Li  = 'fishbase';

data.Wwb = 3.8e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'BoelClar2017';
  comment.Wwb = 'based egg diameter of 0.9 mm: pi/6*0.09^3'; 

data.Ri = 25e3/365;  units.Ri = '#/d';    label.Ri = 'max reproduction rate';  bibkey.Ri = 'fishbase';   
  temp.Ri = C2K(9);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 

% uni-variate data
% time-length
data.tL= [  ... % time since birth (yr), total length (cm)
0.553	7.887
0.655	10.042
0.742	11.566
0.830	10.149
0.917	8.836
1.033	9.783
1.048	9.363
1.223	9.575
1.383	10.890
1.426	13.255
1.514	14.096
1.572	13.572
1.732	13.258
1.834	12.786
1.936	12.630
2.067	12.631
2.067	12.053
2.227	13.999
2.285	14.472
2.344	15.471
2.460	16.103
2.547	15.211
2.649	16.052
2.838	15.686
2.984	14.217
3.086	15.059
3.246	14.430
3.348	18.529
3.421	17.899
3.523	17.690
3.872	17.168
4.119	18.905
4.236	16.384
4.265	16.384
4.410	21.745
5.109	23.118
5.400	23.699];
data.tL(:,1) = 365 * (0.75 + data.tL(:,1)); % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length', 'Central East Grounds'};  
temp.tL    = C2K(9);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'BergHoin2002';
comment.tL = 'data form Central East Grounds';
%
data.tL1 = [ ... % time since birth (yr), total length (cm)
0.524	7.151
0.539	8.569
0.670	7.678
0.859	7.102
0.975	7.681
1.077	8.207
1.223	8.734
1.499	10.681
1.514	11.049
1.616	11.208
1.732	10.841
1.892	11.263
2.009	10.424
2.591	13.109
2.722	14.214
2.955	13.796
3.013	13.587
3.202	14.639
3.421	17.164
3.654	15.170
3.741	16.169
3.930	15.383
4.003	15.383
4.076	15.962
4.279	16.385
4.381	19.065
4.512	17.543
4.702	17.440
4.862	16.338
4.978	17.338
5.066	16.813
5.211	17.445
5.444	19.864
5.517	18.026
5.808	18.292
5.895	17.400
5.983	18.399
6.070	18.242
6.230	17.981
6.390	20.032
6.507	18.667
6.754	19.038
6.885	17.673
6.943	19.145
7.074	18.568
7.263	18.097
7.424	20.936
8.239	19.316];
data.tL1(:,1) = 365 * (0.75 + data.tL1(:,1)); % convert yr to d
units.tL1   = {'d', 'cm'};  label.tL1 = {'time since birth', 'total length', 'Norway Coast'};  
temp.tL1    = C2K(9);  units.temp.tL1 = 'K'; label.temp.tL1 = 'temperature';
bibkey.tL1 = 'BergHoin2002';
comment.tL1 = 'data form Norway Coast';

% t-W data 
data.tW = [ ... % time since birth (yr), gutted wet weight (g)
0.498	1.201
0.607	2.627
0.717	4.128
0.779	2.777
0.935	2.176
1.044	1.126
1.153	1.726
1.308	2.552
1.417	7.054
1.495	9.081
1.651	7.580
1.822	6.304
1.947	4.653
1.963	5.478
2.056	3.902
2.212	6.454
2.290	7.730
2.430	10.657
2.492	14.484
2.555	9.831
2.617	12.908
2.741	11.332
2.928	8.705
3.006	7.580
3.209	6.979
3.333	17.111
3.396	17.261
3.489	19.812
3.816	15.159
4.221	11.482
4.439	26.191
5.374	34.071];
data.tW(:,1) = 365 * (0.75 + data.tW(:,1)); % convert yr to d
data.tW(:,2) = data.tW(:,2) * 1.15; % convert gutted to full wet weight (guess)
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight', 'Central East Grounds'};  
temp.tW    = C2K(9);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'BergHoin2002';
comment.tW = 'data form Central East Grounds';
%
data.tW1 = [ ... % time since birth (yr), gutted wet weight (g)
0.561	0.901
0.670	2.326
0.810	0.826
0.981	1.501
0.981	0.600
1.137	1.051
1.277	1.276
1.277	1.876
1.604	3.677
1.713	2.176
1.900	3.302
2.056	1.426
2.056	3.077
2.555	5.478
2.726	7.430
2.726	6.529
2.788	5.779
2.928	6.079
2.991	5.028
3.287	6.079
3.442	15.159
3.551	7.205
3.769	10.657
3.894	7.955
4.019	8.856
4.050	6.979
4.252	9.156
4.424	20.188
4.439	14.484
4.798	12.608
4.907	8.480
4.969	10.657
5.047	9.831
5.218	10.281
5.421	21.689
5.452	15.460
5.701	14.184
5.919	10.356
6.012	12.908
6.044	11.632
6.184	10.582
6.402	22.289
6.511	16.886
6.745	17.036
6.900	9.906
6.963	13.283
7.072	12.983
7.259	10.432
7.445	23.114
8.193	13.508];
data.tW1(:,1) = 365 * (0.75 + data.tW1(:,1)); % convert yr to d
data.tW1(:,2) = data.tW1(:,2) * 1.15; % convert gutted to full wet weight (guess)
units.tW1  = {'d', 'g'};  label.tW1 = {'time since birth', 'wet weight', 'Norway coast'};  
temp.tW1  = C2K(9);  units.temp.tW1 = 'K'; label.temp.tW1 = 'temperature';
bibkey.tW1 = 'BergHoin2002';
comment.tW1 = 'data form Norway coast';


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
set1 = {'tL','tL1'}; subtitle1 = {'Data from CEG, N coast'};
set2 = {'tW','tW1'}; subtitle2 = {'Data from CEG, N coast'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Links
metaData.links.id_CoL = 'CTLN'; % Cat of Life
metaData.links.id_ITIS = '171677'; % ITIS
metaData.links.id_EoL = '46573103'; % Ency of Life
metaData.links.id_Wiki = 'Ammodytes_marinus'; % Wikipedia
metaData.links.id_ADW = 'Ammodytes_marinus'; % ADW
metaData.links.id_Taxo = '160649'; % Taxonomicon
metaData.links.id_WoRMS = '126751'; % WoRMS
metaData.links.id_fishbase = 'Ammodytes-marinus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Ammodytes_marinus}}';
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
bibkey = 'BergHoin2002'; type = 'Article'; bib = [ ... 
'author = {O. A. Bergstad and \o{A}. S. H{\o}ines and T. J{\o}rgensen}, ' ... 
'year = {2002}, ' ...
'title = {Growth of sandeel, \emph{Ammodytes marinus}, in the northern {N}orth {S}ea and {N}orwegian coastal waters}, ' ...
'journal = {Fisheries Research}, ' ...
'volume = {56}, ' ...
'pages = {9-23}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'RegnGibb2018'; type = 'Article'; bib = [ ... 
'doi = {10.1016/j.seares.2018.01.003}, ' ...
'author = {Thomas R\''{e}gnier and Fiona M. Gibb and Peter J. Wright}, ' ... 
'year = {2018}, ' ...
'title = {Temperature effects on egg development and larval condition in the lesser sandeel, \emph{Ammodytes marinus}}, ' ...
'journal = {J. Sea Research}, ' ...
'volume = {134}, ' ...
'pages = {34-41}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BoelClar2017'; type = 'Article'; bib = [ ... 
'doi = {10.1111/jfb.13341}, ' ...
'author = {P. Boulcott and J. Clarke and P. J. Wright}, ' ... 
'year = {2017}, ' ...
'title = {Effect of size on spawning time in the lesser sandeel \emph{Ammodytes marinus}}, ' ...
'journal = {Journal of Fish Biology}, ' ...
'volume = {91}, ' ...
'pages = {362-367}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Ammodytes-marinus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

