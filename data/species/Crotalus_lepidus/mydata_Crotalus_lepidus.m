function [data, auxData, metaData, txtData, weights] = mydata_Crotalus_lepidus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Viperidae';
metaData.species    = 'Crotalus_lepidus'; 
metaData.species_en = 'Mottled rock rattlesnake'; 

metaData.ecoCode.climate = {'BS','BWh'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTa','0iTd'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCv'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(26); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 01 01];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 01 01];

%% set data
% zero-variate data

data.ab = 4*30.5;     units.ab = 'd';    label.ab = 'age at birth';     bibkey.ab = 'Wiki';
  temp.ab = C2K(30); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 33.6*365;  units.am = 'd';    label.am = 'life span';                    bibkey.am = 'AnAge';   
  temp.am = C2K(25); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 20.4;    units.Lb  = 'cm';  label.Lb  = 'SVL at birth';      bibkey.Lb  = 'Beau1995';
data.Lp  = 40;    units.Lp  = 'cm';  label.Lp  = 'SVL at puberty';      bibkey.Lp  = 'Beau1995';
data.Li  = 70;    units.Li  = 'cm';  label.Li  = 'ultimate SVL for females';  bibkey.Li  = 'Beau1995';

data.Wwb = 6.8;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';             bibkey.Wwb = 'Beau1995';
data.Wwi = 219;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';             bibkey.Wwi = 'AnAge';
  
data.Ri  = 3.6/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';          bibkey.Ri  = 'Beau1995';   
  temp.Ri = C2K(30);   units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2-6 young per litter, 1 litter per yr; Wiki: 6-8 young per litter';

% univariate data
% time-length data
data.tLB_f = [ ... % rattle segments (#), SVL (cm)
0.905	21.319
2.976	29.084
3.062	30.427
3.910	32.480
4.033	33.333
4.928	37.098
5.040	35.015
6.031	42.691
6.048	37.063
6.050	37.430
7.091	37.765
8.015	38.838
8.951	42.724
8.955	43.825
10.044	45.993
10.995	43.640
11.020	40.092
12.080	44.952];
data.tLB_f(:,1) = data.tLB_f(:,1) * 365/ 1.34; % convert rattle segments to d
units.tLB_f  = {'d', 'cm'};  label.tLB_f = {'time since birth', 'SVL', 'female'};  
temp.tLB_f   = C2K(30);  units.temp.tLB_f = 'K'; label.temp.tLB_f = 'temperature';
bibkey.tLB_f = 'Beau1995'; comment.tLB_f = 'Data for females from Boquillas, 560 m elevation';
%
data.tLB_m = [ ... % rattle segments (#), SVL (cm)
2.008	26.912
2.988	31.897
3.915	33.704
4.024	30.887
6.045	46.238
7.005	46.208
7.055	48.776
8.056	48.990
8.103	40.670
10.099	49.784
10.992	43.028
11.104	51.098
12.035	43.730
12.145	51.311
13.086	46.512
13.117	54.217];
data.tLB_m(:,1) = data.tLB_m(:,1) * 365/ 1.34; % convert rattle segments to d
units.tLB_m  = {'d', 'cm'};  label.tLB_m = {'time since birth', 'SVL', 'male'};  
temp.tLB_m   = C2K(30);  units.temp.tLB_m = 'K'; label.temp.tLB_m = 'temperature';
bibkey.tLB_m = 'Beau1995'; comment.tLB_m = 'Data for males from Boquillas, 560 m elevation';
%
data.tLG_f = [ ... % rattle segments (#), SVL (cm)
0.986	21.561
2.039	24.831
2.932	27.862
7.071	42.659
7.119	44.859
8.114	43.483
8.122	45.440
9.080	45.044
9.094	48.469
10.029	42.324
10.128	47.091];
data.tLG_f(:,1) = data.tLG_f(:,1) * 365/ 1.18; % convert rattle segments to d
units.tLG_f  = {'d', 'cm'};  label.tLG_f = {'time since birth', 'SVL', 'female'};  
temp.tLG_f   = C2K(27);  units.temp.tLG_f = 'K'; label.temp.tLG_f = 'temperature';
bibkey.tLG_f = 'Beau1995'; comment.tLG_f = 'Data for females from Grapevine Hills, 1036 m elevation';
%
data.tLG_m = [ ... % rattle segments (#), SVL (cm)
2.049	27.155
2.988	31.897
4.063	30.763
4.157	34.308
6.055	48.684
7.090	47.551
7.980	49.971
8.000	54.985
8.989	52.142
9.035	53.853
9.132	57.887
10.059	49.662
10.065	51.130
10.085	56.267
10.093	58.224
11.159	54.766
12.113	53.269
12.146	61.586
13.017	59.236
14.164	55.898];
data.tLG_m(:,1) = data.tLG_m(:,1) * 365/ 1.18; % convert rattle segments to d
units.tLG_m  = {'d', 'cm'};  label.tLG_m = {'time since birth', 'SVL', 'male'};  
temp.tLG_m   = C2K(27);  units.temp.tLG_m = 'K'; label.temp.tLG_m = 'temperature';
bibkey.tLG_m = 'Beau1995'; comment.tLG_m = 'Data for males from Grapevine Hills, 1036 m elevation';

% time-weight data
data.tWB_f = [ ... % rattle segments (#), weight (g)
0.960	7.073
2.081	16.346
3.043	26.203
3.198	19.493
3.995	20.468
5.045	43.119
5.078	32.532
6.084	48.508
7.037	45.001
8.013	74.905
8.026	37.031
8.986	42.991
10.079	70.090
10.099	41.126
11.020	49.320
11.037	72.708
12.104	62.497];
data.tWB_f(:,1) = data.tWB_f(:,1) * 365/ 1.34; % convert rattle segments to d
units.tWB_f  = {'d', 'g'};  label.tWB_f = {'time since birth', 'weight', 'female'};  
temp.tWB_f   = C2K(30);  units.temp.tWB_f = 'K'; label.temp.tWB_f = 'temperature';
bibkey.tWB_f = 'Beau1995'; comment.tWB_f = 'Data for females from Boquillas';
%
data.tWB_m = [ ... % time rattle segments (#), weight (g)
4.042	31.042
6.068	82.483
7.041	51.126
7.055	70.616
7.997	51.517
10.993	123.396
11.989	69.201
12.032	129.898
13.016	114.133
13.029	75.703];
data.tWB_m(:,1) = data.tWB_m(:,1) * 365/ 1.34; % convert rattle segments to d
units.tWB_m  = {'d', 'g'};  label.tWB_m = {'time since birth', 'weight', 'male'};  
temp.tWB_m   = C2K(30);  units.temp.tWB_m = 'K'; label.temp.tWB_m = 'temperature';
bibkey.tWB_m = 'Beau1995'; comment.tWB_m = 'Data for males from Boquillas';
%
data.tWG_f = [ ... % rattle segments (#), weight (g)
2.086	23.028
4.961	36.451
6.964	55.038
7.029	90.670
7.979	83.265
8.004	62.097
8.030	98.850
9.055	84.191
10.030	56.175
10.057	95.156
10.080	126.897];
data.tWG_f(:,1) = data.tWG_f(:,1) * 365/ 1.18; % convert rattle segments to d
units.tWG_f  = {'d', 'g'};  label.tWG_f = {'time since birth', 'weight', 'female'};  
temp.tWG_f   = C2K(27);  units.temp.tWG_f = 'K'; label.temp.tWG_f = 'temperature';
bibkey.tWG_f = 'Beau1995'; comment.tWG_f = 'Data for females from Grapevine Hills';
%
data.tWG_m = [ ... % rattle segments (#), weight (g)
3.050	35.670
6.041	99.753
7.023	81.204
7.955	104.989
8.084	175.140
8.127	123.895
8.995	112.048
9.000	119.288
9.989	111.318
10.008	81.241
10.103	160.308
11.079	133.406
12.024	173.898
12.049	210.094
12.065	176.675
13.039	203.238
14.130	169.632];
data.tWG_m(:,1) = data.tWG_m(:,1) * 365/ 1.18; % convert rattle segments to d
units.tWG_m  = {'d', 'g'};  label.tWG_m = {'time since birth', 'weight', 'male'};  
temp.tWG_m   = C2K(27);  units.temp.tWG_m = 'K'; label.temp.tWG_m = 'temperature';
bibkey.tWG_m = 'Beau1995'; comment.tWG_m = 'Data for males from Grapevine Hills';

%% set weights for all real data
weights = setweights(data, []);
weights.am = 5 * weights.am;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tLB_f','tLB_m'}; subtitle1 = {'Data for females, males from Boquillas'};
set2 = {'tLG_f','tLG_m'}; subtitle2 = {'Data for females, males from Grapevine Hills'};
set3 = {'tWB_f','tWB_m'}; subtitle3 = {'Data for females, males from Boquillas'};
set4 = {'tWG_f','tWG_m'}; subtitle4 = {'Data for females, males from Grapevine Hills'};
metaData.grp.sets = {set1,set2,set3,set4};
metaData.grp.subtitle = {subtitle1,subtitle2,subtitle3,subtitle4};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
D2 = 'Temperatures are guessed and assumed to vary as T_mean+25*sin(2*pi*(t+100)/365 with T_mean - 15 C for B and 10 C for C';
D3 = 'Aging in tL and tW data based on rattle segments, which is generally considered to be unreliable';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Facts
F1 = 'Sex is determined by incubation temperature';
metaData.bibkey.F1 = 'retileDB'; 
F2 = 'Females somewhat smaller than males';
metaData.bibkey.F2 = 'Beau1995'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = 'ZPBX'; % Cat of Life
metaData.links.id_ITIS = '174312'; % ITIS
metaData.links.id_EoL = '1056411'; % Ency of Life
metaData.links.id_Wiki = 'Crotalus_lepidus'; % Wikipedia
metaData.links.id_ADW = 'Crotalus_lepidus'; % ADW
metaData.links.id_Taxo = '50385'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Crotalus&species=lepidus'; % ReptileDB
metaData.links.id_AnAge = 'Crotalus_lepidus'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Crotalus_lepidus}}';
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
bibkey = 'Beau1995'; type = 'Article'; bib = [ ... 
'author = {Steven J. Beaupre}, ' ... 
'year = {1995}, ' ...
'title = {Comparative Ecology of the Mottled Rock Rattlesnake, \emph{Crotalus lepidus}, in {B}ig {B}end {N}ational {P}ark}, ' ...
'journal = {Herpetologica}, ' ...
'volume = {51(1)}, ' ...
'pages = {45-56}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Crotalus_lepidus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Crotalus_lepidus/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'retileDB'; type = 'Misc'; bib = ...
'howpublished = {\url{http://reptile-database.reptarium.cz/species?genus=Crotalus&species=lepidus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

