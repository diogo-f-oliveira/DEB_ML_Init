function [data, auxData, metaData, txtData, weights] = mydata_Bathyraja_parmifera

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Rajiformes'; 
metaData.family     = 'Arhynchobatidae';
metaData.species    = 'Bathyraja_parmifera'; 
metaData.species_en = 'Alaska skate'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPN'};
metaData.ecoCode.habitat = {'0iMb'};
metaData.ecoCode.embryo  = {'Ms'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(2.3); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2020 10 27];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};  

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 10 27]; 

%% set data
% zero-variate data;
data.ab = 1.3*365;    units.ab = 'd';   label.ab = 'age at birth';            bibkey.ab = 'guess';    
  temp.ab = C2K(2.3);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 16*365; units.am = 'd';   label.am = 'life span';                bibkey.am = 'MattGund2007';   
  temp.am = C2K(2.3); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 22;   units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'MattGund2007';
data.Lp = 93;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'MattGund2007';
data.Lpm = 92;   units.Lpm  = 'cm';  label.Lpm  = 'total length at puberty for males'; bibkey.Lpm  = 'MattGund2007'; 
data.Li  = 135;  units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'fishbase'; 

data.Wwi = 18.2e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight'; bibkey.Wwi = 'fishbase'; 

data.Ri  = 15/365;units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'Eber2005';   
  temp.Ri = C2K(2.3); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time - length
data.tL_f = [ ... % time since birth (yr), total length (cm)
0.003	27.641
0.003	25.799
0.012	21.806
0.041	29.792
0.956	35.643
0.956	29.808
1.001	32.573
1.945	37.503
1.960	39.346
1.976	33.818
1.976	31.668
1.976	30.439
1.990	40.882
2.978	55.027
2.979	51.955
2.994	47.656
2.995	44.892
2.995	42.435
3.967	63.336
3.968	60.572
3.969	48.594
3.969	46.137
3.997	66.100
3.998	57.808
3.999	51.973
4.986	76.560
4.986	74.717
4.987	66.424
4.987	64.275
4.988	62.125
4.988	60.589
4.988	58.439
4.988	56.289
5.001	73.181
5.016	71.339
5.945	79.340
5.946	75.962
5.946	72.890
5.975	81.798
5.976	71.355
5.977	69.513
5.977	67.363
5.977	64.291
5.993	62.449
6.951	73.522
6.965	83.657
6.965	80.279
6.967	70.758
6.997	65.230
6.998	57.859
7.953	97.188
7.954	93.809
7.955	81.217
7.957	69.853
7.970	87.360
7.970	83.981
7.971	73.846
7.971	72.004
7.984	91.967
7.986	76.611
8.988	103.348
8.988	100.584
8.989	92.291
8.991	76.321
9.003	98.127
9.004	88.913
9.005	86.456
9.005	84.613
9.005	82.771
9.005	80.621
9.006	72.635
9.018	96.284
9.019	94.442
9.962	110.428
9.962	107.357
9.963	100.293
9.992	105.515
9.994	94.458
9.995	87.087
10.008	98.144
10.009	92.001
10.024	89.852
10.952	109.831
10.982	107.989
10.984	92.325
10.997	105.532
10.998	102.768
10.998	99.082
10.998	97.240
10.999	94.783
11.971	112.920
11.972	109.234
11.972	107.698
11.973	102.784
11.988	100.328
11.988	98.485
11.988	96.028
12.019	92.343
12.978	100.345
12.978	98.195
12.979	94.202
12.991	113.858
12.993	103.109
13.007	104.952
13.953	99.747
13.981	116.639
13.983	104.047
13.983	102.204
13.997	110.497
13.997	108.654
13.997	107.119
15.001	113.585
15.002	110.514
15.016	116.043
15.978	101.624
16.007	106.846
16.008	103.775
16.008	99.475
16.967	111.776];
data.tL_f(:,1) = 365 * data.tL_f(:,1); % convert yr to d
units.tL_f = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f = C2K(2.3); units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'MattGund2007'; 
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
0.003	21.499
0.957	28.272
0.971	35.336
2.006	34.125
2.020	42.725
3.010	39.057
3.969	48.594
3.983	60.572
4.012	65.486
4.013	55.044
4.987	68.574
5.003	55.982
5.046	78.403
5.932	68.590
5.974	87.633
5.975	85.176
5.975	83.026
6.008	61.528
6.008	57.842
6.979	89.800
6.981	77.515
6.981	75.979
6.997	67.687
7.009	92.565
7.940	79.681
7.955	84.903
8.000	87.053
8.974	88.298
8.976	77.856
8.987	106.419
9.004	94.134
9.035	82.771
9.978	101.215
9.994	91.387
10.010	86.473
10.984	95.397
10.984	90.175
11.987	106.777
12.003	99.407
12.031	115.378
12.992	107.716
12.993	104.030
13.007	107.102
13.967	106.811
13.998	99.748
14.013	103.126
14.043	96.370
14.989	93.929
15.033	102.222
15.033	97.923];
data.tL_m(:,1) = 365 * data.tL_m(:,1); % convert yr to 
units.tL_m = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m = C2K(2.3);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'MattGund2007'; 
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 15 * weights.tL_f;
weights.tL_m = 15 * weights.tL_m;
weights.ab = 0 * weights.ab;
weights.Li = 3 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.p_M = 3 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Grouping
set1 = {'tL_f','tL_m'}; subtitle1 = 'Data for females, males';
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males and females are assumed not to differ';
D2 = 'temperatures are guessed';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'length-weight: Ww in g = 0.00372*(TL in cm)^3.11';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'KXVK'; % Cat of Life
metaData.links.id_ITIS = '160939'; % ITIS
metaData.links.id_EoL = '46560776'; % Ency of Life
metaData.links.id_Wiki = 'Bathyraja'; % Wikipedia
metaData.links.id_ADW = 'Bathyraja_parmifera'; % ADW
metaData.links.id_Taxo = '163728'; % Taxonomicon
metaData.links.id_WoRMS = '271528'; % WoRMS
metaData.links.id_fishbase = 'Bathyraja-parmifera'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Bathyraja}}';  
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
bibkey = 'MattGund2007'; type = 'Article'; bib = [ ...
'doi = {10.1007/s10641-007-9223-8}, ' ...
'author = {Mary Elizabeth Matta and Donald R. Gunderson}, ' ...
'year = {2007}, ' ...
'title  = {Age, growth, maturity, and mortality of the {A}laska skate, \emph{Bathyraja parmifera}, in the eastern {B}ering {S}ea}, ' ...
'journal = {Environmental Biology of Fishes}, ' ...
'volume = {80(2-3)}, ' ...
'pages = {309-323}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Eber2005'; type = 'Article'; bib = [ ...
'doi = {10.1111/j.1095-8649.2005.00628.x}, ' ...
'author = {DD. A. Ebert}, ' ...
'year = {2005}, ' ...
'title  = {Reproductive biology of skates, \emph{Bathyraja} ({I}shiyama), along the eastern {B}ering {S}ea continental slope}, ' ...
'journal = {Journal of Fish Biology}, ' ...
'volume = {66}, ' ...
'pages = {618-649}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Bathyraja-parmifera.html}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
