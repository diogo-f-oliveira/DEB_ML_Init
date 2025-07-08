function [data, auxData, metaData, txtData, weights] = mydata_Malacoraja_senta

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Rajiformes'; 
metaData.family     = 'Rajidae';
metaData.species    = 'Malacoraja_senta'; 
metaData.species_en = 'Smooth skate'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MANW'};
metaData.ecoCode.habitat = {'0iMb'};
metaData.ecoCode.embryo  = {'Ms'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(4.1); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2020 10 27];                          
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
data.ab = 4*365;    units.ab = 'd';   label.ab = 'age at birth';            bibkey.ab = 'guess';    
  temp.ab = C2K(4.1);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 14*365; units.am = 'd';   label.am = 'life span';                bibkey.am = 'NataSuli2007';   
  temp.am = C2K(4.1); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 31;   units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'NataSuli2007';
data.Lp = 54;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'SuliCici2009';
data.Lpm = 56;   units.Lpm  = 'cm';  label.Lpm  = 'total length at puberty for males'; bibkey.Lpm  = 'SuliCici2009'; 
data.Li  = 70;  units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'NataSuli2007'; 
data.Lim  = 88;  units.Lim  = 'cm';  label.Lim  = 'ultimate total length for males';   bibkey.Lim  = 'NataSuli2007'; 

data.Wwi = 3.4e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight'; bibkey.Wwi = {'fishbase','NataSuli2007'}; 
 comment.Wwi = 'based on 0.00575*Li^3.13, see F1';
data.Wwim = 7e3; units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males'; bibkey.Wwim = {'fishbase','NataSuli2007'};
 comment.Wwim = 'based on 0.00575*Lim^3.13, see F1';

data.Ri  = 2/365;units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(4.1); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time-length
data.tL_f = [ ... % time since birth (yr), total length (cm)
 3 37.5
 6 44.3
 7 49.7
 8 53.1
 9 54.5
10 55.7
11 56.5
12 56.8
13 57.3
14 59.9];
data.tL_f(:,1) = 365 * data.tL_f(:,1); % convert yr to d
units.tL_f = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f = C2K(4.1); units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'SuliCici2009'; 
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
 3 31.7
 4 36.1
 5 39.6
 6 43.7
 7 48.2
 8 51.3
 9 54.0
10 57.0
11 58.5
12 60.8
13 62.0
14 63.5
15 65.4];
data.tL_m(:,1) = 365 * data.tL_m(:,1); % convert yr to 
units.tL_m = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m = C2K(4.1);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'SuliCici2009'; 
comment.tL_m = 'Data for males';
%
data.tL_1f = [ ... % time since birth (yr), total length (cm)
1.971	31.702
1.988	32.618
2.934	36.099
3.001	38.482
3.947	40.864
3.963	43.796
3.964	42.880
3.965	39.215
3.966	37.749
3.967	35.916
4.962	39.948
4.963	38.115
4.978	43.063
4.979	41.597
5.960	39.948
5.961	39.215
5.976	42.330
5.977	41.230
5.992	45.812
5.993	44.346
5.994	43.063
6.957	43.429
6.958	41.780
6.972	51.859
6.973	50.576
6.989	48.377
6.990	44.529
7.007	47.094
7.008	45.812
7.971	46.178
7.972	44.712
7.973	43.246
7.987	48.927
7.988	47.644
8.003	54.607
8.004	53.691
8.005	52.408
8.006	50.759
8.949	56.440
8.983	54.791
8.984	54.241
8.985	53.141
8.986	51.675
8.987	49.843
8.988	48.194
8.989	47.094
9.965	52.592
9.980	60.838
9.981	55.890
9.982	54.424
9.983	50.576
10.013	59.921
10.014	57.906
10.015	56.990
10.944	60.288
10.962	52.958
10.978	58.089
10.979	54.424
10.980	51.309
10.995	56.806
11.012	55.890
11.960	53.141
11.992	57.906
11.993	56.073
11.994	54.607
12.009	62.487
12.010	58.639
12.026	60.838
12.990	58.272
12.991	56.623
13.007	61.571
13.008	55.707
14.022	56.990
14.023	55.524];
data.tL_1f(:,1) = 365 * data.tL_1f(:,1); % convert yr to d
units.tL_1f = {'d', 'cm'};  label.tL_1f = {'time since birth', 'total length', 'female'};  
temp.tL_1f = C2K(4.1); units.temp.tL_1f = 'K'; label.temp.tL_1f = 'temperature';
bibkey.tL_1f = 'NataSuli2007'; 
comment.tL_1f = 'Data for females';
%
data.tL_1m = [ ... % time since birth (yr), total length (cm)
2.970	30.635
2.984	31.049
2.985	34.563
3.975	37.264
4.980	38.932
4.981	39.965
4.995	42.860
5.954	44.733
5.970	39.152
5.971	40.186
5.972	42.460
5.973	46.594
6.000	47.421
6.975	44.127
6.976	47.435
6.990	48.469
7.005	52.396
7.020	49.709
7.964	50.963
7.980	47.449
7.995	53.237
7.996	55.511
9.000	50.977
9.001	54.491
9.002	56.765
9.015	59.453
10.005	58.433
10.020	56.779
10.036	52.852
10.051	51.198
10.964	58.653
10.995	56.793
10.996	60.513
11.010	54.312
11.970	61.354
11.971	63.421
11.985	59.287
12.990	63.228
12.991	65.089
13.020	60.541
13.995	63.449
14.010	65.310
14.025	62.416
15.015	63.050
15.016	65.323
15.017	67.184
15.018	68.838];
data.tL_1m(:,1) = 365 * data.tL_1m(:,1); % convert yr to 
units.tL_1m = {'d', 'cm'};  label.tL_1m = {'time since birth', 'total length', 'male'};  
temp.tL_1m = C2K(4.1);  units.temp.tL_1m = 'K'; label.temp.tL_1m = 'temperature';
bibkey.tL_1m = 'NataSuli2007'; 
comment.tL_1m = 'Data for males';

% time-weight
data.tWw_f = [ ... % time since birth (yr), wet weight (g)
 3 170
 6 360
 7 640
 8 630
 9 680
10 700
11 760
12 830
13 850
14 990];
data.tWw_f(:,1) = 365 * data.tWw_f(:,1); % convert yr to d
units.tWw_f = {'d', 'g'};  label.tWw_f = {'time since birth', 'wet weight', 'female'};  
temp.tWw_f = C2K(4.1); units.temp.tWw_f = 'K'; label.temp.tWw_f = 'temperature';
bibkey.tWw_f = 'SuliCici2009'; 
comment.tWw_f = 'Data for females';
%
data.tWw_m = [ ... % time since birth (yr), wet weight (g)
 3  150
 4  220
 5  290
 6  360
 7  520
 8  600
 9  730
10  880
11  940
12 1080
13 1110
14 1150
15 1250];
data.tWw_m(:,1) = 365 * data.tWw_m(:,1); % convert yr to 
units.tWw_m = {'d', 'g'};  label.tWw_m = {'time since birth', 'wet weight', 'male'};  
temp.tWw_m = C2K(4.1);  units.temp.tWw_m = 'K'; label.temp.tWw_m = 'temperature';
bibkey.tWw_m = 'SuliCici2009'; 
comment.tWw_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;
weights.ab = 0 * weights.ab;
weights.Wwi = 0 * weights.Wwi;
weights.Wwim = 0 * weights.Wwim;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Grouping
set1 = {'tL_f','tL_m'}; subtitle1 = 'SuliCici2009 data for females, males';
set2 = {'tL_1f','tL_1m'}; subtitle2 = 'NataSuli2007 data for females, males';
set3 = {'tWw_f','tWw_m'}; subtitle3 = 'SuliCici2009 data for females, males';
metaData.grp.sets = {set1,set2,set3};
metaData.grp.subtitle = {subtitle1,subtitle2,subtitle3};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'temperatures are guessed';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Facts
F1 = 'length-weight: Ww in g = 0.00575*(TL in cm)^3.13';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3XKTD'; % Cat of Life
metaData.links.id_ITIS = '564151'; % ITIS
metaData.links.id_EoL = '46560537'; % Ency of Life
metaData.links.id_Wiki = 'Malacoraja'; % Wikipedia
metaData.links.id_ADW = 'Malacoraja_senta'; % ADW
metaData.links.id_Taxo = '179532'; % Taxonomicon
metaData.links.id_WoRMS = '158554'; % WoRMS
metaData.links.id_fishbase = 'Malacoraja-senta'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Malacoraja_senta}}';  
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
bibkey = 'NataSuli2007'; type = 'Article'; bib = [ ...
'doi = {10.1007/s10641-007-9220-y}, ' ...
'author = {Lisa J. Natanson and James A. Sulikowski and Jeff R. Kneebone and Paul C. Tsang}, ' ...
'year = {2007}, ' ...
'title  = {Age and growth estimates for the smooth skate, \emph{Malacoraja senta}, in the {G}ulf of {M}aine}, ' ...
'journal = {Environmental Biology of Fishes}, ' ...
'volume = {80(2-3)}, ' ...
'pages = {293-308}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SuliCici2009'; type = 'Article'; bib = [ ...
'doi = {10.1111/j.1095-8649.2009.02443.x}, ' ...
'author = {J. A. Sulikowski and A. M. Cicia and J. R. Kneebone and L.J.Natanson}, ' ...
'year = {2009}, ' ...
'title  = {Age and size at sexual maturity of the smooth skate \emph{Malacoraja senta} from the western {G}ulf of {M}aine}, ' ...
'journal = {Journal of Fish Biology}, ' ...
'volume = {75}, ' ...
'pages = {2832-2838}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Malacoraja-senta.html}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
