function [data, auxData, metaData, txtData, weights] = mydata_Etmopterus_baxteri
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Squaliformes'; 
metaData.family     = 'Etmopteridae';
metaData.species    = 'Etmopterus_baxteri'; 
metaData.species_en = 'New Zealand lanternshark';

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MIS'};
metaData.ecoCode.habitat = {'0iMpb'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(4.6); % K, body temperature
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2020 11 08];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 01];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 01];

%% set data
% zero-variate data;
data.ab = 2.7*365; units.ab = 'd';    label.ab = 'age at birth';               bibkey.ab = 'guess';   
  temp.ab = C2K(4.6); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 60*365; units.am = 'd';    label.am = 'life span';               bibkey.am = 'IrviStev2006';   
  temp.am = C2K(4.6); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb = 18;    units.Lb  = 'cm';   label.Lb  = 'total length at birth';  bibkey.Lb  = 'fishbase';
  comment.Lb = 'value for E. granulosus, which might be conspecific'; 
data.Lp = 46; units.Lp  = 'cm'; label.Lp  = 'total length at puberty';bibkey.Lp  = 'fishbase';
  comment.Lp = 'value for E. granulosus, which might be conspecific'; 
data.Li  = 75;   units.Li  = 'cm';   label.Li  = 'ultimate total length';  bibkey.Li  = 'fishbase';

data.Wwi = 2.4e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00380*Li^3.09, see F1';

data.Ri  = 12/365/3; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(4.6); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '10-13 pups per litter in E. granulosus, which might be conspecific; 1 litter each 3 yr assumed, in view of ab';
  
% univariate data
% time - length
data.tL_f = [ ... % time since birth (yr), total length (cm)
6.569	29.961
7.451	36.057
9.510	36.063
11.373	40.246
12.941	38.336
13.039	44.255
14.706	44.086
15.980	40.085
16.275	43.916
17.157	48.096
17.549	50.013
18.529	46.360
18.922	48.276
19.510	50.018
19.804	37.833
20.490	54.199
20.686	58.029
21.373	46.020
21.568	46.020
21.569	56.291
22.255	48.459
22.745	46.198
23.627	46.374
24.804	54.560
25.098	48.294
26.569	68.317
26.667	42.205
29.020	54.224
29.216	52.484
30.196	67.980
31.176	63.804
31.373	67.983
31.961	56.321
33.235	76.518
33.235	68.162
33.824	72.342
33.922	64.335
33.922	70.079
34.314	71.995
34.510	67.992
34.608	70.081
34.706	66.426
34.804	67.993
34.902	64.338
35.098	66.427
35.196	70.083
35.294	68.168
35.588	70.084
35.784	68.344
35.980	70.259
36.078	66.430
36.471	70.261
36.569	68.868
37.059	68.870
37.353	68.871
37.353	74.441
37.451	72.353
37.843	68.872
38.137	68.699
38.137	72.355
38.431	72.356
38.431	74.619
38.627	64.522
38.824	72.357
38.824	74.620
38.922	68.527
39.020	65.220
39.118	74.621
39.216	76.188
39.216	65.743
39.314	68.528
39.314	70.095
39.314	60.346
39.412	72.358
39.412	61.565
39.510	64.525
39.608	74.448
39.706	68.529
40.000	68.530
40.392	70.098
40.686	66.095
40.784	72.014
40.784	68.010
40.882	70.274
41.176	70.274
41.275	71.842
41.373	78.283
41.373	64.704
41.471	71.842
41.471	70.275
41.765	72.017
41.863	70.276
41.961	72.192
42.353	70.974
42.353	66.100
42.451	70.452
42.549	72.542
42.549	76.197
43.333	72.544
43.824	76.375
44.020	69.935
44.020	72.372
44.020	74.287
44.216	68.542
44.608	68.892
44.804	65.933
44.804	70.633
44.902	73.767
44.902	64.192
45.000	74.638
45.098	68.023
45.196	70.286
45.196	72.201
45.490	74.291
45.490	70.809
45.588	73.769
45.588	72.724
45.882	70.636
45.882	70.462
45.980	80.385
46.078	70.811
46.373	70.115
46.569	68.549
46.765	72.206
46.765	74.469
46.961	69.943
47.059	72.729
47.451	73.600
47.843	74.124
47.843	72.209
48.137	70.121
48.431	73.951
48.627	70.470
49.216	68.383
49.314	70.472
49.412	78.132
49.412	70.298
49.804	70.300
49.804	66.644
49.902	72.215
50.294	70.301
50.784	68.387
52.157	72.395
52.549	72.222
53.235	69.961
56.765	76.587
57.549	64.403];
data.tL_f(:,1) = 365 * data.tL_f(:,1); % convert yr to d
n=size(data.tL_f,1); for i=2:n; if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3; end; end
units.tL_f = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f = C2K(4.6); units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'IrviStev2006'; 
comment.tL_f = 'Data for females, based on external spine age estimates';
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
4.510	24.037
9.314	37.629
10.000	40.242
12.255	40.075
12.843	46.169
13.039	42.688
13.529	38.163
15.196	42.172
15.392	50.180
20.490	49.847
20.980	54.026
21.471	58.206
22.157	56.293
23.039	56.295
23.529	54.556
24.412	56.648
24.608	55.778
24.706	58.737
25.000	52.645
25.196	58.217
25.686	50.384
25.784	58.740
25.882	60.656
26.275	54.042
26.961	60.659
27.941	58.224
28.235	50.218
28.333	54.570
28.431	60.489
28.529	56.485
28.824	54.920
28.922	60.316
29.804	56.489
30.980	60.496
31.078	56.319
31.667	58.409
31.863	60.499
32.255	58.585
32.941	58.065
33.039	56.498
33.529	61.026
34.020	54.238
34.216	60.506
34.314	62.421
34.804	56.155
35.098	58.419
35.588	60.510
35.980	74.437
36.078	62.774
36.667	60.339
36.765	64.517
36.863	56.335
36.961	51.810
37.157	64.344
37.451	58.426
37.843	62.779
38.235	66.436
38.333	56.340
38.922	62.434
39.118	56.342
39.510	60.521
40.000	62.263
40.000	56.345
40.098	60.523
40.588	66.617
41.373	66.097
42.255	62.096
43.333	64.536
43.529	56.181
44.902	60.363
45.000	58.274
46.667	64.372
48.039	58.283];
data.tL_m(:,1) = 365 * data.tL_m(:,1); % convert yr to 
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
units.tL_m = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m = C2K(4.6);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'IrviStev2006'; 
comment.tL_m = 'Data for males, based on external spine age estimates';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

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
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length - weight: Ww in g = 0.00380 * (TL in cm)^3.09';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3BM6X'; % Cat of Life
metaData.links.id_ITIS = '160674'; % ITIS
metaData.links.id_EoL = '46560255'; % Ency of Life
metaData.links.id_Wiki = 'Etmopterus_baxteri'; % Wikipedia
metaData.links.id_ADW = 'Etmopterus_baxteri'; % ADW
metaData.links.id_Taxo = '106274'; % Taxonomicon
metaData.links.id_WoRMS = '271627'; % WoRMS
metaData.links.id_fishbase = 'Etmopterus-baxteri'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Etmopterus_baxteri}}';  
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
bibkey = 'IrviStev2006'; type = 'article'; bib = [ ...
'doi = {10.1007/s10641-006-9130-4}, ' ...
'author = {Sarah B. Irvine and John D. Stevens and Laurie J. B. Laurenson}, ' ...
'year = {2006}, ' ...
'title  = {Comparing external and internal dorsal-spine bands to interpret the age and growth of the giant lantern shark, \emph{Etmopterus baxteri} ({S}qualiformes: {E}tmopteridae)}, ' ...
'journal = {Environ Biol Fish}, ' ...
'volume = {77}, ' ...
'pages = {253-264}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Etmopterus-baxteri.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
