function [data, auxData, metaData, txtData, weights] = mydata_Phoca_largha
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Carnivora'; 
metaData.family     = 'Phocidae';
metaData.species    = 'Phoca_largha'; 
metaData.species_en = 'Spotted seal'; 

metaData.ecoCode.climate = {'MC','ME'};
metaData.ecoCode.ecozone = {'MPN', 'MAN'};
metaData.ecoCode.habitat = {'0iMc'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiCvf'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37); % K, Seal body temperature should be between 36.5-37.5 C
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Lb'; 'Li'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Starrlight Augustine','Ana Sofia Aniceto'};    
metaData.date_subm = [2021 12 06];              
metaData.email    = {'sta@akvaplan.niva.no'};            
metaData.address  = {'Akvaplan-niva, Tromso, Norway'};   

metaData.curator     = {'Bas Kooijman'};
metaData.email_cur   = {'bas.kooijman@vu.nl'}; 
metaData.date_acc    = [2021 12 06];

%% set data
% zero-variate data

data.tg = 319;    units.tg = 'd';    label.tg = 'gestation time';              bibkey.tg = 'AnAge';   
  temp.tg = C2K(37);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 24;  units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(37);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 1279;    units.tp = 'd';    label.tp = 'time since birth at puberty (female)';           bibkey.tp = 'AnAge';
  temp.tp = C2K(37);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 1643;    units.tpm = 'd';    label.tpm = 'time since birth at puberty (male)';           bibkey.tpm = 'AnAge';
  temp.tpm = C2K(37);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 33.6*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(37);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 100;   units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'Wiki';  
data.Li  = 140;   units.Li  = 'cm';  label.Li  = 'total length fem.';   bibkey.Li  = 'Wiki';
  comment.Li = 'Wiki: 150-210 cm';
  
data.Wwb = 7.1e3;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwx = 21.3e3;   units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';   bibkey.Wwx = 'AnAge';
data.Wwi = 85e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight fem.';     bibkey.Wwi = 'AnAge';
  comment.Wwi = 'Wiki: 81-109 kg';

data.Ri  = 1/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(37);    units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data

% time-length
data.tL = [ ...
0.908	114.190
0.945	111.861
0.946	109.014
0.982	110.309
1.016	120.660
1.054	117.814
1.089	122.214
1.094	105.911
1.095	100.994
1.097	93.230
1.123	132.565
1.131	102.288
1.135	89.090
1.170	93.231
1.242	102.807
1.827	114.458
1.865	108.506
1.902	106.695
1.932	134.385
1.970	129.210
1.970	126.881
1.971	126.105
1.972	121.705
2.005	135.421
2.091	89.100
2.117	130.505
2.119	121.707
2.157	114.979
2.269	109.028
2.484	130.509
2.526	110.066
2.558	128.698
2.559	126.369
2.888	134.654
2.890	126.114
3.000	126.892
3.073	129.739
3.148	124.047
3.150	115.507
3.151	112.919
3.291	138.022
3.292	135.693
3.293	128.965
3.295	123.013
3.296	120.684
3.917	134.147
4.027	133.889
4.029	128.972
4.029	127.679
4.461	161.583
4.471	123.284
4.652	137.001
4.836	136.227
4.939	163.658
5.128	141.405
5.166	139.594
5.199	151.240
5.208	116.563
5.237	148.135
5.240	134.937
5.493	151.243
5.495	144.514
5.936	146.072
6.045	149.955
6.058	102.598
6.081	154.354
6.115	163.412
6.118	152.284
6.122	137.275
6.191	155.908
6.234	129.513
6.271	131.842
6.490	136.761
6.926	156.951
6.961	162.385
6.968	135.472
7.107	165.234
7.181	167.046
7.253	169.376
7.294	155.661
7.810	148.161
7.883	153.855
8.149	117.629
8.176	154.376
8.248	162.140
8.446	108.833
8.542	163.696
8.586	136.265
9.056	164.736
9.095	156.197
9.096	154.127
9.136	139.894
9.173	138.859
9.205	158.786
9.500	152.578
9.904	155.170
10.092	141.715
11.085	137.585
11.298	168.641
13.137	165.296
13.579	162.713
14.241	161.684
14.868	154.704
15.054	145.649
15.200	148.238
16.960	166.888
16.999	157.573
17.294	154.470
17.294	153.435
17.364	168.963
22.255	164.355
22.398	179.366
23.467	169.285
25.195	168.785
25.200	147.047]; 
data.tL(:,1) = data.tL(:,1) * 365; % yr to day
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'standard length'};  
temp.tL    = C2K(37);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'QuakCitt2009';
comment.tL = 'Data from 1970''s';

%% set weights for all real data
weights = setweights(data, []);
weights.Wwx = 0 * weights.Wwx;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} and E_Hp only';
metaData.discussion = struct('D1',D1);

%% Links
metaData.links.id_CoL = '6VBY4'; % Cat of Life
metaData.links.id_ITIS = '180642'; % ITIS
metaData.links.id_EoL = '46559166'; % Ency of Life
metaData.links.id_Wiki = 'Phoca_largha'; % Wikipedia
metaData.links.id_ADW = 'Phoca_largha'; % ADW
metaData.links.id_Taxo = '67455'; % Taxonomicon
metaData.links.id_WoRMS = '255021'; % WoRMS
metaData.links.id_MSW3 = '14001059'; % MSW3
metaData.links.id_AnAge = 'Phoca_largha'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Phoca_largha}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/Phoca_largha}}';
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
bibkey = 'ZhanSong2014'; type = 'Article'; bib = [ ... 
'doi = {10.1139/cjz-2013-0295}, ' ...
'author = {P. J. Zhang and X. R. Song and J. B. Han and L. M. Wang and Y. Yang}, ' ... 
'year = {2014}, ' ...
'title = {Milk composition, milk consumption, and growth rate of a captive spotted seal (\emph{Phoca largha}) pup from {L}iaodong {B}ay, {C}hina}, ' ...
'journal = {Can. J. Zool.}, ' ...
'volume = {92}, ' ...
'pages = {449–452}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'QuakCitt2009'; type = 'techreport'; bib = [ ... 
'author = {Lori Quakenbush and John Citta and Justin Crawford}, ' ... 
'year = {2009}, ' ...
'title = {Bology of the spotted seal (\emph{Phoca largha}) in Alaska from 1962-2008}, ' ...
'institution = {National Marine Fisheries Service}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

