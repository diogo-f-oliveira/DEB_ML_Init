function [data, auxData, metaData, txtData, weights] = mydata_Aphanopus_carbo
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Scombriformes'; 
metaData.family     = 'Trichiuridae';
metaData.species    = 'Aphanopus_carbo'; 
metaData.species_en = 'Black scabbardfish'; 

metaData.ecoCode.climate = {'MB', 'MC'};
metaData.ecoCode.ecozone = {'MANE'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};
metaData.T_typical  = C2K(8.5); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 12 15];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 03];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 03];

%% set data
% zero-variate data

data.ab = 79/24;   units.ab = 'd';   label.ab = 'age at birth';               bibkey.ab = 'guess';   
  temp.ab = C2K(21.1);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'based on Trichiurus nanhaiensis';
data.tp = 8*365;   units.tp = 'd';   label.tp = 'time since birth at puberty'; bibkey.tp = 'Wiki';   
  temp.tp = C2K(8.7);  units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
data.am = 14*365;   units.am = 'd';   label.am = 'life span';                 bibkey.am = 'Wiki';   
  temp.am = C2K(8.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 80;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';     bibkey.Lp  = 'Wiki'; 
data.Li  = 151;     units.Li  = 'cm';  label.Li  = 'ultimate total length of female';  bibkey.Li  = 'MoraSena1996';
data.Lim  = 135;     units.Lim  = 'cm';  label.Lim  = 'ultimate total length of male'; bibkey.Lim  = 'MoraSena1996';

data.Wwb = 5.2e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on guessed egg diameter of 1 mm: pi/6*.1^3';
data.Wwi = 3362;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for female';      bibkey.Wwi = {'MoraSena1996','fishbase'};
  comment.Wwi = 'based on 0.00046*Li^3.15, see F1';
data.Wwim = 2362;   units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for male';      bibkey.Wwim = {'MoraSena1996','fishbase'};
  comment.Wwim = 'based on 0.00046*Lim^3.15, see F1';

data.Ri  = 2e5/365; units.Ri  = '#/d'; label.Ri  = 'max reproduction rate'; bibkey.Ri = 'guess';   
  temp.Ri = C2K(8.5); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'Based on kap = 0.97, as found for  Trichiurus nanhaiensis';
 
% uni-variate data

% time-length
data.tL_f = [ ... % time since birth (yr), total length (cm)
0.001	70.154
0.001	67.687
0.001	62.049
0.001	60.287
0.002	58.877
0.956	85.351
0.958	82.531
0.959	79.007
0.961	74.426
0.962	72.311
0.965	64.206
1.007	70.551
1.932	70.592
1.944	95.615
1.945	94.205
1.945	93.148
1.947	87.861
1.949	82.928
1.974	75.175
2.928	115.041
2.929	112.927
2.933	101.649
2.935	98.478
2.948	119.271
2.951	111.166
2.952	110.108
2.952	109.051
2.953	107.289
3.914	127.419
3.916	124.248
3.916	122.486
3.919	116.847
3.920	114.732
3.920	113.323
3.920	112.618
3.921	110.503
3.924	104.160
3.939	120.020
3.940	118.610
3.967	106.276
4.924	136.979
4.926	131.693
4.927	129.579
4.928	127.112
4.929	124.292
4.930	122.883
4.931	121.473
4.931	119.359
4.932	118.301
4.933	115.834
4.956	112.664
4.957	111.606
4.957	110.197
4.958	107.377
4.959	105.968
4.960	103.853
5.943	123.985
5.950	107.421
5.958	141.254
5.960	137.377
5.962	133.148
5.963	130.681
5.963	129.272
5.964	128.215
5.964	126.452
5.969	116.232
5.969	115.528
5.969	114.118
5.970	113.061
5.971	110.946
5.971	109.184
5.988	122.577
5.989	120.462
5.990	118.700
6.949	142.355
6.956	126.496
6.972	140.594
6.973	138.832
6.974	137.422
6.979	125.087
6.979	123.325
6.980	120.858
6.981	119.449
6.983	114.515
6.984	112.048
6.984	110.991
6.985	109.229
6.996	135.661
6.997	134.251
6.998	132.489
6.999	129.317
7.919	142.398
7.953	113.500
7.960	149.095
7.968	130.065
7.969	128.655
7.987	137.114
7.994	121.256];
data.tL_f(:,1) = 365 * (1 + data.tL_f(:,1)); % convert yr to d
n=size(data.tL_f,1); for i=2:n; if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3; end; end
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f    = C2K(8.5);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'MoraSena1996';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
0.001	57.391
0.001	59.243
0.001	65.721
0.003	61.712
0.022	69.423
0.023	67.881
0.952	80.596
0.952	79.362
0.953	77.512
0.954	75.662
0.959	59.627
0.959	57.777
0.971	92.007
0.971	89.540
0.972	87.690
0.974	82.756
0.978	68.880
0.979	65.796
0.980	63.329
0.980	61.787
0.995	86.150
0.995	84.299
0.999	71.965
1.000	70.731
1.882	89.918
1.889	70.492
1.926	91.464
1.928	88.072
1.928	86.222
1.933	71.420
1.951	84.373
1.952	81.906
1.952	79.748
1.953	77.897
1.954	75.739
1.954	73.272
1.970	94.242
2.897	115.283
2.919	113.435
2.926	94.316
2.926	91.849
2.928	87.840
2.928	85.682
2.931	78.590
2.942	111.586
2.943	110.353
2.949	89.384
2.951	83.833
2.952	80.133
3.895	119.986
3.896	117.827
3.901	100.559
3.915	127.696
3.916	123.688
3.917	121.837
3.920	111.970
3.921	109.503
3.922	106.728
3.922	105.186
3.923	103.644
3.927	89.768
3.941	115.364
3.941	114.130
4.892	128.388
4.894	124.071
4.900	104.953
4.901	103.103
4.902	99.711
4.917	121.606
4.917	119.756
4.918	119.139
4.918	116.981
4.919	115.439
4.919	113.589
4.920	112.047
4.936	130.242
4.943	109.890
4.943	108.348
5.916	125.692
5.916	122.917
5.917	121.375
5.917	119.833
5.918	117.983
5.919	115.824
5.920	113.049
5.922	105.957
5.942	111.509
5.943	109.967
5.944	107.192
5.945	101.950
5.959	129.396
6.922	105.726
6.937	127.929
6.939	122.379
6.940	118.370
6.941	115.595
6.944	106.961
7.009	111.591
8.048	129.557];
data.tL_m(:,1) = 365 * (1 + data.tL_m(:,1)); % convert yr to d
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m    = C2K(8.5);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'MoraSena1996';
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
weights.tp = 0 * weights.tp;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 2 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: tp ignored since (tp,Lp) is inconsistent with tL data';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);  

%% Facts
F1 = 'depth range 180 to 1700 m; bathypelagic by day but moves upwards in the water column at night to feed at middle depths';
metaData.bibkey.F1 = 'Wiki';
F2 = 'length-weight: wet weight (g) = 0.00046*(TL in cm)^3.15';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '5VM7L'; % Cat of Life
metaData.links.id_ITIS = '172389'; % ITIS
metaData.links.id_EoL = '46577356'; % Ency of Life
metaData.links.id_Wiki = 'Aphanopus_carbo'; % Wikipedia
metaData.links.id_ADW = 'Aphanopus_carbo'; % ADW
metaData.links.id_Taxo = '161103'; % Taxonomicon
metaData.links.id_WoRMS = '127085'; % WoRMS
metaData.links.id_fishbase = 'Aphanopus-carbo'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Aphanopus_carbo}}';
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
bibkey = 'MoraSena1996'; type = 'Article'; bib = [ ... 
'author = {B. Morales-Nin and D. Sena-Carvalho}, ' ... 
'year = {1996}, ' ...
'title = {Age and growth of the black scabbard fish (\emph{Aphanopus carbo}) off {M}adeira}, ' ...
'journal = {Fisheries Research}, ' ...
'volume = {25}, ' ...
'pages = {239-251}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Aphanopus-carbo.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
