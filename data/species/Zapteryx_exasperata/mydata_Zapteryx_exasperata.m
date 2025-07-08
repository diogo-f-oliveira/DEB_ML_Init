function [data, auxData, metaData, txtData, weights] = mydata_Zapteryx_exasperata

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Rhinopristiformes'; 
metaData.family     = 'Rhinobatidae';
metaData.species    = 'Zapteryx_exasperata'; 
metaData.species_en = 'Banded guitarfish';

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPE'};
metaData.ecoCode.habitat = {'0iMcd','0iMm'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(23.1); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2020 11 04];                          
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
data.ab = 6*30.5;  units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';    
  temp.ab = C2K(23.1); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'fishbase gives 3-4 mnth';
data.am = 22*365;  units.am = 'd';    label.am = 'life span';              bibkey.am = 'CervTova2018';   
  temp.am = C2K(23.1); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 16.5;     units.Lb  = 'cm';  label.Lb  = 'total length at birth'; bibkey.Lb  = 'fishbase';
  comment.Lb = '15-18 cm';
data.Lp  = 67;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty';bibkey.Lp  = 'fishbase'; 
  comment.Lp = '57-77 cm';
data.Lpm  = 67;   units.Lpm = 'cm';  label.Lpm  = 'total length at puberty for males'; bibkey.Lpm  = 'fishbase'; 
  comment.Lpm = '64-70 cm';
data.Li  = 97;    units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';
data.Lim  = 83;    units.Lim  = 'cm';  label.Lim  = 'ultimate total length for males'; bibkey.Lim  = 'fishbase';

data.Wwi = 6.76e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00741*Li^3.00, see F1';

data.Ri  = 8/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(23.1); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '4-11 pups per litter; assumed 1 litter per 1 yr';

% uni-variate data at f
data.tL_f = [ ... % time since birth (yr), total length (cm)
0.052	21.845
4.981	59.568
5.998	61.355
7.041	70.596
8.011	72.897
8.012	74.182
8.060	77.009
9.030	80.082
9.052	73.656
9.053	76.740
10.000	78.014
10.000	78.785
10.000	81.355
10.001	83.668
10.001	85.725
11.041	80.315
11.041	82.371
11.041	82.885
11.042	83.913
12.036	85.444
12.036	87.500
12.036	88.528
12.037	93.668
12.106	83.901
13.006	87.489
13.030	90.829
14.046	86.191
14.047	86.962
14.047	87.476
14.047	88.247
14.047	88.761
14.047	89.532
14.048	93.645
14.970	91.064
15.017	87.722
15.018	92.605
15.018	94.918
15.964	90.281
16.011	92.337
16.034	87.710
16.035	93.878
16.036	95.677
17.028	91.297
17.029	93.353
17.029	94.124
17.029	95.409
17.029	96.180
17.051	88.469
17.052	90.525
18.023	94.883
18.023	96.939
18.023	97.967
18.024	99.509
18.045	91.028
18.046	93.084
19.016	93.844
19.016	95.386
19.016	96.671
19.017	97.956
19.039	92.301
20.033	93.318
20.033	94.860
20.034	96.402
21.051	96.647
21.051	97.418
21.076	102.301
21.098	93.819
21.098	94.847
22.021	96.893
22.044	94.836
22.046	103.060];
data.tL_f(:,1) = data.tL_f(:,1) * 365; % convert yr to d
n=size(data.tL_f,1); for i=2:n; if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3; end; end
units.tL_f = {'d', 'cm'};  label.tL_f = {'time since birth','total length','female'};  
  temp.tL_f = C2K(23.1); units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'CervTova2018';
comment.tL_f = 'data for females';
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
3.985	51.099
5.003	55.456
5.004	56.484
5.004	57.769
5.004	59.054
5.951	60.585
7.016	65.970
7.016	66.484
7.988	72.898
8.034	67.500
8.034	68.785
8.035	70.584
8.035	72.383
9.005	72.372
9.005	74.942
9.005	74.942
9.006	76.741
10.047	79.299
10.070	74.415
10.070	74.929
10.070	76.471
10.070	76.985
10.070	77.499
10.071	78.527
10.921	72.863
10.992	74.662
11.017	76.974
11.017	77.745
11.017	78.773
11.017	79.030
11.017	79.801
11.017	80.058
11.017	81.087
11.018	82.115
11.018	84.171
11.987	80.561
11.987	81.332
11.988	82.103
11.988	82.617
11.988	83.902
12.010	74.650
12.011	79.019
12.011	79.533
12.011	80.304
12.057	75.163
12.057	76.448
12.057	77.219
12.058	78.504
12.957	81.321
12.957	82.092
12.958	83.377
12.958	83.634
13.003	75.666
13.028	80.549
13.030	90.315
13.051	77.722
13.051	78.750
13.997	75.398
13.997	78.225
13.998	79.510
13.998	80.795
13.998	81.823
14.022	82.336
14.046	83.621
14.046	83.878
14.070	85.163
14.070	85.163
15.015	81.297
15.016	82.325
15.016	83.096
15.016	83.353
15.016	86.694
15.017	86.951
15.109	78.212
16.010	85.654
16.010	86.939
16.010	87.710
16.032	79.743
16.033	81.799
16.033	83.598
16.033	84.883
17.051	85.385
17.051	86.413
17.051	86.927
17.074	83.072
18.021	87.944
18.021	88.972
18.043	82.032
18.044	84.346
19.038	87.418
19.039	89.217];
data.tL_m(:,1) = data.tL_m(:,1) * 365; % convert yr to d
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
units.tL_m = {'d', 'cm'};  label.tL_m = {'time since birth','total length','male'};  
  temp.tL_m = C2K(23.1); units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'CervTova2018';
comment.tL_m = 'data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 10 * weights.tL_f;
weights.tL_m = 10 * weights.tL_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.p_M = 5 * weights.psd.p_M;
%weights.psd.v = 5 * weights.psd.v;

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
D1 = 'males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'Temperatures are guessed';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Facts
F1 = 'length-weight: Ww in g = 0.00741 * (TL in cm)^3.00';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Ovoviviparous';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '5CX6S'; % Cat of Life
metaData.links.id_ITIS = '160826'; % ITIS
metaData.links.id_EoL = '46560712'; % Ency of Life
metaData.links.id_Wiki = 'Zapteryx_exasperata'; % Wikipedia
metaData.links.id_ADW = 'Zapteryx_exasperata'; % ADW
metaData.links.id_Taxo = '190224'; % Taxonomicon
metaData.links.id_WoRMS = '283213'; % WoRMS
metaData.links.id_fishbase = 'Zapteryx-exasperata'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Zapteryx_exasperata}}'; 
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
bibkey = 'CervTova2018'; type = 'Article'; bib = [ ... 
'doi = {10.1071/MF16403}, ' ...
'author = {Fabi\''{a}n Cervantes-Guti\''{e}rrez and Javier Tovar-\''{A}vila and Felipe Galv\''{a}n-Maga\~{n}a}, ' ... 
'year = {2018}, ' ...
'title = {Age and growth of the banded guitarfish \emph{Zapteryx exasperata} ({C}hondrichthyes: {T}rygonorrhinidae)}, ' ...
'journal = {Marine and Freshwater Research}, ' ...
'volume = {69}, ' ...
'pages = {66-73}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Zapteryx-exasperata.html}}';   
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
 