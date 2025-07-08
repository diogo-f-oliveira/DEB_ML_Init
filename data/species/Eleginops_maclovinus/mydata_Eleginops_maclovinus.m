function [data, auxData, metaData, txtData, weights] = mydata_Eleginops_maclovinus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Eleginopsidae';
metaData.species    = 'Eleginops_maclovinus'; 
metaData.species_en = 'Patagonian blenny'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MASW','MPSE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcd'};
metaData.ecoCode.embryo  = {'Mpe'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'Hsm'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(7); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};
metaData.date_subm = [2021 03 21]; 
metaData.email    = {'bas.kooijman@vu.nl'}; 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 03 21]; 

%% set data
% zero-variate data

data.am = 10*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'LicaBarr2006';   
  temp.am = C2K(7);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 35.7; units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females'; bibkey.Lp  = 'LicaBarr2006'; 
data.Li  = 90; units.Li  = 'cm';  label.Li  = 'ultimate total length';               bibkey.Li  = 'fishbase';

data.Wwb = 3.3e-2; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based egg diameter of 4.1 mm: 4/3*pi*0.2^3'; 
data.Wwp = 496; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty for females';   bibkey.Wwp = 'LicaBarr2006';
  comment.Wwp = 'based on 9.8e-3*Lp^3.03, see F1';
data.Wwi = 8.2e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'LicaBarr2006';
  comment.Wwi = 'based on 9.8e-3*Li^3.03, see F1';

data.Ri = 45e3/365;  units.Ri = '#/d';    label.Ri = 'max reproduction rate'; bibkey.Ri = 'guess';   
  temp.Ri = C2K(7);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = 'based on kap = 0.6';
  
% uni-variate data
% t-L data 
data.tL = [ ... % time since birth (yr), total length (cm)
0.000	16.176
0.000	14.295
0.000	11.285
0.000	9.404
0.000	7.147
0.879	21.818
0.879	25.204
0.905	18.809
0.905	20.690
0.931	30.846
0.957	8.276
0.957	10.533
0.957	12.414
0.957	17.304
1.009	13.918
1.940	32.727
1.940	30.470
1.940	28.589
1.940	27.461
1.940	25.956
1.966	39.498
1.966	36.865
1.966	34.232
1.966	24.451
1.991	42.132
1.991	22.947
2.017	21.442
2.017	19.185
2.017	17.680
2.017	14.671
2.897	35.361
2.897	45.893
2.897	48.903
2.922	39.122
2.922	41.379
2.922	50.408
2.948	25.956
2.948	28.213
2.948	37.618
2.948	54.545
2.974	30.094
2.974	52.288
3.000	33.480
3.000	44.013
3.905	33.480
3.931	39.498
3.931	41.379
3.931	44.389
3.931	46.270
3.931	48.527
3.931	50.784
3.931	53.041
3.931	54.545
3.931	57.179
3.931	59.812
3.931	63.574
3.931	66.207
4.009	61.317
4.966	70.345
4.966	67.712
4.966	66.959
4.966	66.207
4.966	64.702
4.966	63.950
4.966	61.693
4.966	60.940
4.991	75.235
4.991	59.060
4.991	57.931
4.991	56.803
4.991	46.270
4.991	45.517
5.017	56.050
5.043	54.922
5.043	53.041
5.043	50.784
5.948	62.821
5.948	63.950
5.948	65.831
5.948	66.959
5.948	68.464
5.948	70.721
5.948	72.978
5.948	75.611
5.948	77.492
5.948	78.997
5.948	81.254
6.905	58.683
6.931	83.511
6.931	82.006
6.931	64.326
6.957	80.125
6.957	75.235
6.957	73.730
6.957	71.473
6.957	68.840
6.983	78.245
6.983	75.987
7.009	77.116
7.991	74.483
7.991	75.987
7.991	78.245
8.017	79.749
8.043	82.006
8.043	82.759
8.043	85.016
8.974	78.997
8.974	80.878
9.957	82.382
9.957	84.263
11.043	91.034];
data.tL(:,1) = 365 * (0.8 + data.tL(:,1));  % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(7);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'BricArkh2005';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Ri = 0 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.kap = 2 * weights.psd.kap;
weights.psd.p_M = 2 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = '';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'weight-length relationship: W = 9.8e-3 * (TL in cm)^3.03';
metaData.bibkey.F1 = 'LicaBarr2006'; 
F2 = 'Marine; demersal; preferred 10.7 C';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '3972J'; % Cat of Life
metaData.links.id_ITIS = '642813'; % ITIS
metaData.links.id_EoL = '46573094'; % Ency of Life
metaData.links.id_Wiki = 'Eleginops_maclovinus'; % Wikipedia
metaData.links.id_ADW = 'Eleginops_maclovinus'; % ADW
metaData.links.id_Taxo = '173599'; % Taxonomicon
metaData.links.id_WoRMS = '280634'; % WoRMS
metaData.links.id_fishbase = 'Eleginops-maclovinus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Eleginops_maclovinus}}';
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
bibkey = 'LicaBarr2006'; type = 'Article'; bib = [ ... 
'doi = {10.1007/s10641-006-9054-z}, ' ...
'author = {Roberto R. Licandeo and Claudio A. Barrientos and Mar\''{i}a Teresa Gonz\''{a}lez}, ' ... 
'year = {2006}, ' ...
'title = {Age, growth rates, sex change and feeding habits of notothenioid fish \emph{Eleginops maclovinus} from the central-southern {C}hilean coast}, ' ...
'journal = {Environ. Biol Fish.}, ' ...
'volume = {77}, ' ...
'pages = {51-61}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BricArkh2005'; type = 'Article'; bib = [ ... 
'author = {Paul Brickle and Alexander I. Arkhipkin and Zhanna N. Shcherbich}, ' ... 
'year = {2005}, ' ...
'title = {Age and growth in a temperate euryhaline notothenioid, \emph{Eleginops maclovinus} from the {F}alkland {I}slands}, ' ...
'journal = {J. Mar. Biol. Ass. U.K.}, ' ...
'volume = {85}, ' ...
'pages = {1217-1221}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/466}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
