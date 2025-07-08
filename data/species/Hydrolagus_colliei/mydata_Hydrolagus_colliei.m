function [data, auxData, metaData, txtData, weights] = mydata_Hydrolagus_colliei

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Chimaeriformes'; 
metaData.family     = 'Chimaeridae';
metaData.species    = 'Hydrolagus_colliei'; 
metaData.species_en = 'Spotted ratfish'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPNE'};
metaData.ecoCode.habitat = {'0iMcd'};
metaData.ecoCode.embryo  = {'Ms'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(6); % K, body temp
metaData.data_0     = {'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2020 10 17];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};      

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 03 30];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 03 30];

%% set data
% zero-variate data;
data.am = 21*365; units.am = 'd';    label.am = 'life span';               bibkey.am = 'KingMcPhi2015';   
  temp.am = C2K(6); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 13;   units.Lb  = 'cm';  label.Lb  = 'total length at birth'; bibkey.Lb  = 'KingMcPhi2015';
data.Lp  = 51.7;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'KingMcPhi2015';
  comment.Lp = 'based on PSCL 39.3 cm and F2';
data.Lpm  = 39.7;   units.Lpm  = 'cm';  label.Lpm  = 'total length at puberty'; bibkey.Lpm  = 'KingMcPhi2015';
  comment.Lpm = 'based on PSCL 30.2 cm and F2';
data.Li  = 100;  units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'fishbase';

data.Wwb = 4.2; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'KingMcPhi2015';
  comment.Wwb = 'based on oocyte diameter 2 cm: pi/6*2^3';
data.Wwi = 2.5e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'EoL';

data.Ri  = 18/365; units.Ri  = '#/d';label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'KingMcPhi2015';   
  temp.Ri = C2K(6); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data at f
data.tL_f = [ ... % time since birth (yr), pre-supra caudal fin length (cm)
1.915	8.235
2.017	13.437
2.920	18.981
2.979	13.780
2.980	12.270
2.981	11.263
2.982	10.927
2.983	10.592
2.984	9.417
2.985	8.914
3.031	15.122
3.883	18.148
3.884	16.974
3.888	13.283
3.889	12.444
3.890	11.437
3.891	10.430
3.993	14.458
5.007	15.975
5.010	13.794
5.012	11.445
5.013	10.606
5.172	12.453
5.971	14.304
6.875	18.673
6.931	16.995
6.976	24.714
6.978	23.036
6.981	20.183
6.982	19.344
7.880	28.747
7.885	23.881
7.887	22.707
7.888	21.532
7.891	19.015
7.892	18.344
8.044	25.560
8.898	27.076
8.901	24.224
8.902	23.049
8.953	25.063
9.004	27.916
9.852	34.465
9.857	29.599
9.858	28.593
9.859	27.922
9.860	27.251
9.861	25.908
9.865	21.881
10.863	38.331
10.867	34.640
10.875	27.761
10.876	26.586
10.912	42.526
10.923	32.292
10.964	43.701
10.965	43.198
10.981	28.601
11.825	39.009
11.830	34.143
11.836	28.271
11.890	27.600
11.987	37.333
11.992	32.635
12.042	35.991
12.829	49.754
12.835	43.546
12.837	42.372
12.838	40.862
12.894	38.681
12.897	36.332
12.899	34.151
13.854	40.869
13.904	44.393
13.905	43.722
13.906	41.708
13.910	38.520
13.912	36.675
13.956	45.232
14.821	35.842
14.865	44.567
14.866	43.896
14.867	43.057
14.872	38.527
14.918	45.910
14.967	49.434
14.978	39.535
15.772	46.419
15.774	44.909
15.775	43.903
15.830	42.561
15.831	41.386
16.790	44.077
16.896	45.253
17.006	42.737
17.856	47.441
17.912	45.260
17.913	43.918
18.873	45.770
18.875	44.260
18.876	43.253
20.856	40.918
20.906	43.771];
data.tL_f(:,1) = 365 * data.tL_f(:,1); % convert yr to d
data.tL_f(:,2) = data.tL_f(:,2)/ 0.76; % convert PSCL to TL
units.tL_f = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f = C2K(6); units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'KingMcPhi2015';
comment.tL_f = 'data for females, converted from PSCL using F2';
%
data.tL_m = [ ... % time since birth (yr), pre-supra caudal fin length (cm)
1.887	14.205
1.946	8.760
1.947	7.935
2.850	13.716
2.851	12.396
2.853	10.746
2.854	9.756
2.855	8.766
2.901	15.862
2.950	19.493
2.951	18.338
3.762	10.587
3.811	14.053
3.859	19.499
3.860	18.344
3.862	16.694
3.863	15.374
3.920	12.404
3.921	11.084
4.879	15.216
4.881	13.070
4.982	19.177
5.890	19.513
5.892	17.698
5.895	14.563
5.991	25.124
6.849	22.820
6.850	21.500
6.851	20.675
6.852	19.850
6.962	17.045
7.758	22.166
7.867	20.682
7.915	25.467
7.916	24.642
7.917	23.157
8.775	20.688
8.813	35.705
8.822	27.289
8.823	26.464
8.824	24.814
8.825	24.319
9.838	26.966
9.839	25.976
9.840	25.316
9.841	24.161
9.842	23.005
9.886	31.422
9.943	28.782
9.995	29.607
10.738	34.893
10.794	32.253
10.800	27.137
10.801	26.642
10.852	28.128
10.896	36.544
10.905	28.953
10.957	29.614
11.805	36.385
11.864	31.270
11.870	26.155
11.913	35.231
11.915	34.076
11.920	29.455
11.970	32.591
12.768	35.732
12.823	34.577
12.826	31.112
12.877	33.917
12.878	33.092
12.879	32.102
13.733	33.593
13.787	32.274
13.945	35.245
14.800	35.086
14.905	36.572
15.869	35.423];
data.tL_m(:,1) = 365 * data.tL_m(:,1); % convert yr to d
data.tL_m(:,2) = data.tL_m(:,2)/ 0.76; % convert PSCL to TL
units.tL_m = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m = C2K(6); units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'KingMcPhi2015';
comment.tL_m = 'data for males, converted from PSCL using F2';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

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
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'length-weight: Ww in g = 0.00025*(TL in cm)^2.755';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'length-length from photo: pre-supra caudal fin length PSCL = 0.76*TL';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '6MK28'; % Cat of Life
metaData.links.id_ITIS = '161015'; % ITIS
metaData.links.id_EoL = '46561126'; % Ency of Life
metaData.links.id_Wiki = 'Hydrolagus_colliei'; % Wikipedia
metaData.links.id_ADW = 'Hydrolagus_colliei'; % ADW
metaData.links.id_Taxo = '42198'; % Taxonomicon
metaData.links.id_WoRMS = '271406'; % WoRMS
metaData.links.id_fishbase = 'Hydrolagus-colliei'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Hydrolagus_colliei}}'; 
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
bibkey = 'KingMcPhi2015'; type = 'Article'; bib = [ ... 
'doi = {10.1016/j.dsr2.2013.11.002}, ' ...
'author = {J.R. King and R.P. McPhie}, ' ...
'year = {2015}, ' ...
'title  = {Preliminary age, growth and maturity estimates of spotted ratfish (\emph{Hydrolagus colliei}) in {B}ritish {C}olumbia}, ' ...
'journal = {Deep-Sea Research II}, ' ...
'volume = {115}, ' ...
'pages = {55-63}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Hydrolagus_colliei.html}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{https://eol.org/pages/46561101/articles}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

