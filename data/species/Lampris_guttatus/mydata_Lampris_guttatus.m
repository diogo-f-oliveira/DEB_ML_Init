function [data, auxData, metaData, txtData, weights] = mydata_Lampris_guttatus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Lampriformes'; 
metaData.family     = 'Lampridae';
metaData.species    = 'Lampris_guttatus'; 
metaData.species_en = 'Opah'; 

metaData.ecoCode.climate = {'MA', 'MC', 'MC'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bpPz', 'bpCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(17); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 03 18];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};  

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 03];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 03];

%% set data
% zero-variate data

data.tp = 4.6*365;   units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'FranGrig2004';
  temp.tp = C2K(17); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 14*365;    units.am = 'd';    label.am = 'life span';                 bibkey.am = 'FranGrig2004';   
  temp.am = C2K(17); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 80;     units.Lp  = 'cm';  label.Lp  = 'total fork at puberty';  bibkey.Lp  = 'FranGrig2004'; 
data.Li  = 200;       units.Li  = 'cm';  label.Li  = 'ultimate fork length';    bibkey.Li  = 'FranGrig2004';
  comment.Li = 'FranGrig2004: max length in New Zealand waters is FL 125 cm';

data.Wwb = 6.4e-3;     units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'Cole2010';
  comment.Wwb = 'based on egg diameter of 2.3 mm: pi/6*0.23^3';
data.Wwi = 250e3;     units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.02239*Li^3.02 Wwi would be 199 kg, see F3';

data.Ri  = 5e5/365;  units.Ri  = '#/d';  label.Ri  = 'max repoduction rate at FL 963 mm';    bibkey.Ri  = 'guess';   
temp.Ri = C2K(17);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'see discussion';

% uni-variate data
% time-length data
% females
data.tL_f = [ ... % time since hatch (yr), fork length (cm)
2.513	62.051
2.514	57.732
2.986	62.068
2.988	56.987
2.988	55.208
3.002	71.978
3.003	70.200
3.491	80.889
3.492	76.570
3.512	69.964
3.513	66.153
4.000	84.465
4.001	82.178
4.001	80.145
4.002	78.621
4.002	76.842
4.003	75.064
4.004	68.203
4.473	88.039
4.496	68.221
4.511	81.688
4.511	79.147
5.002	82.722
5.003	79.927
5.018	90.600
5.019	88.059
5.019	86.534
5.021	78.150
5.022	75.355
5.022	74.084
5.491	92.903
5.491	90.617
5.492	89.346
5.493	85.789
5.963	96.478
5.965	91.396
5.966	85.806
5.980	100.798
5.981	97.241
6.476	84.554
6.491	97.767
6.508	102.850
6.510	92.432
6.529	90.400
6.981	103.375
6.982	100.072
6.982	98.293
6.983	96.007
6.983	94.736
6.985	85.843
7.020	91.943
7.490	104.918
7.494	90.689
7.509	103.140
7.510	99.837
7.510	97.804
7.511	95.772
7.928	100.106
7.982	105.698
7.982	103.665
7.983	101.887
7.999	109.002
8.454	109.272
8.477	91.487
8.478	88.947
8.510	103.685
8.511	101.144
8.512	98.095
8.963	112.086
8.964	110.053
8.987	89.473
9.001	105.227
9.001	104.465
9.021	100.908
9.457	100.924
9.474	109.055
9.474	106.769
9.474	105.752
9.475	102.449
9.965	107.803
9.966	105.262
9.967	103.483
9.967	100.434
10.474	114.173
10.475	109.600
10.947	112.666
10.949	106.060
11.477	107.858
11.477	106.333
11.498	95.916];
data.tL_f(:,1) = data.tL_f(:,1) * 365; % convert yr to d
n=size(data.tL_f,1); for i=2:n; if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3; end; end
units.tL_f = {'d', 'cm'};  label.tL_f = {'time since birth', 'fork length', 'female'};  
temp.tL_f = C2K(17); units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'FranGrig2004';
comment.tL_f = 'Data for females';
% males
data.tL_m = [ ... % time since hatch (yr), fork length (cm)
2.041	56.952
2.514	60.527
2.912	68.672
3.019	77.315
3.439	71.994
4.002	76.334
4.003	73.285
4.510	83.975
4.512	77.623
4.512	76.098
4.513	74.320
4.528	86.516
5.476	80.961
5.527	93.921
5.985	83.774
6.037	92.415
6.041	79.203
6.507	106.915
6.507	105.136
6.526	100.818
6.547	93.704
6.548	87.606
7.003	89.147
7.021	90.672
7.034	108.205
7.530	92.469
7.985	94.264
7.999	110.272
8.508	110.291
8.509	106.479
8.985	98.620
8.999	113.103
9.000	109.038
9.001	107.005
9.493	103.466
9.495	95.081
9.508	115.917
9.964	112.630
9.981	116.442
10.458	105.026
10.458	104.009
10.474	112.649
10.474	111.632
10.475	107.821
10.477	102.231
10.983	115.208
10.984	111.143
10.985	109.364
10.985	107.077
11.475	115.480
11.966	114.482
11.967	111.941
12.987	111.215
13.459	115.552
13.477	117.839];
data.tL_m(:,1) = data.tL_m(:,1) * 365; % convert yr to d
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
units.tL_m = {'d', 'cm'};  label.tL_m = {'time since birth', 'fork length', 'male'};  
temp.tL_m = C2K(17); units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'FranGrig2004';
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
weights.Ri = 0 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 5 * weights.psd.v;

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
D1 = 'Preferred temperature 12.1 C, so body temperature 17 C is assumed';
D2 = 'Males are assumed to differ from females by {p_Am} only';
D3 = ['Cole2010 gives an estimated fecundity of 7.2e6 to 9.7e6 eggs for FL 93.6 cm, ' ...
    'but 5.7e5 seems to be maximum for optimized kappa, given the other best-fitting parameters.'...
    'Notice that 8e6 eggs weigh 51 kg, while a fish of FL 93.6 weighs 23 kg. That seems a lot of eggs, even when accounting for partial dehydration'];
D4 = 'The large value for [p_M] that was found, probably relates to the cost of enthermy';
D5 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4, 'D5',D5);

%% Facts
F1 = 'Keeps its body core approximately 5 C warmer than its environment';
metaData.bibkey.F1 = 'Wiki'; 
F2 = 'weight-length Ww in g = 0.02239*(TL in cm)^3.02';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '3S3ZH'; % Cat of Life
metaData.links.id_ITIS = '166326'; % ITIS
metaData.links.id_EoL = '46564331'; % Ency of Life
metaData.links.id_Wiki = 'Lampris_guttatus'; % Wikipedia
metaData.links.id_ADW = 'Lampris_guttatus'; % ADW
metaData.links.id_Taxo = '153323'; % Taxonomicon
metaData.links.id_WoRMS = '126522'; % WoRMS
metaData.links.id_fishbase = 'Lampris-guttatus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lampris_guttatus}}';
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
bibkey = 'Cole2010'; type = 'Book'; bib = [ ... 
'author = {Kathleen Sabina Cole}, ' ...
'year = {2010}, ' ...
'title  = {Reproduction and sexuality in marine fishes: Patterns and processes}, ' ...
'publisher = {Univ of California Press}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'FranGrig2004'; type = 'techreport'; bib = [ ... 
'author = {Malcolm Francis and Lynda Griggs and Caoimhghin \''{O} Maolag\''{a}in}, ' ... 
'year = {2004}, ' ...
'title = {Growth rate, age at maturity, longevity and natural mortality rate of moonfish (\emph{Lampris guttatus})}, ' ...
'institution = {National Institute of Water and Atmospheric Research Limited (NIWA).}, ' ...
'howpublished = {\url{https://fs.fish.govt.nz/Doc/22484/TUN2003-01 Moonfish growth logevity mortality Objective 1 final.pdf.ashx}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Lampris-guttatus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
