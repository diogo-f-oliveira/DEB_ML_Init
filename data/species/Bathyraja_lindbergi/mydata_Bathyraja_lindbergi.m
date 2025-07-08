function [data, auxData, metaData, txtData, weights] = mydata_Bathyraja_lindbergi

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Rajiformes'; 
metaData.family     = 'Arhynchobatidae';
metaData.species    = 'Bathyraja_lindbergi'; 
metaData.species_en = 'Commander Skate'; 

metaData.ecoCode.climate = {'MC','ME'};
metaData.ecoCode.ecozone = {'MPN'};
metaData.ecoCode.habitat = {'0iMcd'};
metaData.ecoCode.embryo  = {'Ms'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(2.6); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2020 10 30];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};      

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 10 30]; 

%% set data
% zero-variate data;
data.ab = 2*365; units.ab = 'd';    label.ab = 'age at birth';               bibkey.ab = 'guess';   
  temp.ab = C2K(2.6); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 33*365; units.am = 'd';    label.am = 'life span';               bibkey.am = 'Maur2009';   
  temp.am = C2K(2.6); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 17.3;   units.Lb  = 'cm';  label.Lb  = 'total length at birth'; bibkey.Lb  = 'Maur2009';
data.Lp  = 79;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females';   bibkey.Lp  = 'Maur2009';
data.Li  = 102.1; units.Li  = 'cm';  label.Li  = 'ultimate total length for females';   bibkey.Li  = 'Maur2009';

data.Wwi = 9.5e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00490*Li^3.13, see F1';

data.Ri  = 10/365; units.Ri  = '#/d';label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'Eber2005';   
  temp.Ri = C2K(2.6); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data at f
data.tL_f = [ ... % time since birth (yr), total length (cm)
0.547	24.580
1.112	27.565
3.984	37.463
4.021	45.654
4.939	43.058
5.075	37.660
5.894	49.212
6.940	50.898
7.859	48.116
7.945	50.164
9.080	49.618
9.854	63.589
9.864	51.674
9.997	48.697
10.034	56.330
10.086	46.836
10.903	60.994
11.071	69.373
11.811	71.801
11.939	75.340
11.940	73.292
13.035	69.394
13.082	64.368
13.906	70.893
13.907	69.776
13.910	66.611
14.945	80.585
15.830	66.817
15.906	79.850
15.954	74.452
15.957	71.473
17.013	60.500
17.081	83.772
17.093	69.437
17.866	84.339
18.004	76.707
18.954	88.074
19.967	76.728
20.871	91.818
20.878	83.999
20.961	89.212
21.915	96.111
21.964	89.782
22.011	85.500
22.874	98.169
22.924	89.792
22.962	96.122
22.969	88.117
23.052	93.889
24.803	87.205
24.930	92.047
24.931	89.999
25.977	91.872
29.984	102.340
31.952	96.590];
data.tL_f(:,1) = 365 * data.tL_f(:,1); % convert yr to d
units.tL_f = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f = C2K(2.6); units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Maur2009';
comment.tL_f = 'data for females';
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
1.024	28.681
2.979	38.197
3.243	35.965
3.981	40.441
4.019	47.330
4.026	39.139
4.984	41.383
4.986	38.963
5.945	40.462
5.983	47.537
6.989	45.128
8.025	58.357
8.906	48.685
8.910	43.286
8.986	57.808
10.035	55.399
10.036	53.724
10.041	48.511
10.820	55.966
10.980	73.468
11.043	50.011
11.858	66.961
11.903	65.472
11.993	61.936
12.998	61.388
13.869	63.632
13.960	58.606
14.904	78.536
14.943	83.005
15.912	72.589
15.989	85.622
16.006	64.213
16.917	71.855
16.917	71.297
16.947	87.680
16.992	85.819
17.912	81.361
17.950	88.063
17.952	85.643
17.962	74.473
18.866	89.562
18.874	79.323
18.876	77.461
18.908	91.611
18.922	74.856
18.956	86.212
19.910	92.925
19.912	91.435
19.912	90.504
19.915	87.526
19.917	85.292
19.918	83.430
19.919	82.313
20.879	82.509
20.919	86.792
21.019	71.527
21.919	92.015
21.965	88.292
22.923	91.095
23.838	92.780
23.846	82.913
23.848	81.052
23.971	89.803
23.975	85.335
24.889	88.323
26.984	87.787];
data.tL_m(:,1) = 365 * data.tL_m(:,1); % convert yr to d
units.tL_m = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m = C2K(2.6); units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Maur2009';
comment.tL_m = 'data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 10 * weights.tL_f;
weights.tL_m = 10 * weights.tL_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.kap = 3 * weights.psd.kap;

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
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g  = 0.00490 * (TL in cm)^3.13';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '68DZC'; % Cat of Life
metaData.links.id_ITIS = '564262'; % ITIS
metaData.links.id_EoL = '46560765'; % Ency of Life
metaData.links.id_Wiki = 'Bathyraja'; % Wikipedia
metaData.links.id_ADW = 'Bathyraja_lindbergi'; % ADW
metaData.links.id_Taxo = '163715'; % Taxonomicon
metaData.links.id_WoRMS = '271517'; % WoRMS
metaData.links.id_fishbase = 'Bathyraja-lindbergi'; % fishbase


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
bibkey = 'Maur2009'; type = 'Article'; bib = [ ...
'author = {Jasmine Rae Fry Maurer}, ' ...
'year = {2009}, ' ...
'title  = {Life history of two Bering Ses slope skates: \emph{Bathyraja lindbergi} and \emph{B. maculata}}, ' ...
'school = {The Faculty of Moss Landing Marine Laboratories and California State University, Monterey Bay}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Eber2005'; type = 'Article'; bib = [ ...
'doi = {10.1111/j.1095-8649.2005.00628.x}, ' ...
'author = {David A. Ebert}, ' ...
'year = {2005}, ' ...
'title  = {Reproductive biology of skates, \emph{Bathyraja} ({I}shiyama), along the eastern {B}ering {S}ea continental slope}, ' ...
'journal = {Journal of Fish Biology}, ' ...
'volume = {66}, ' ...
'pages = {618-649}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Bathyraja-lindbergi.html}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

