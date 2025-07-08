function [data, auxData, metaData, txtData, weights] = mydata_Maculabatis_astra
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Myliobatiformes'; 
metaData.family     = 'Dasyatidae';
metaData.species    = 'Maculabatis_astra'; 
metaData.species_en = 'Black-spotted whipray'; 

metaData.ecoCode.climate = {'MA','MB'};
metaData.ecoCode.ecozone = {'MASE','MIW'};
metaData.ecoCode.habitat = {'0iMr'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.7); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2020 10 30];                          
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
data.ab = 15*30.5; units.ab = 'd';   label.ab = 'age at birth';            bibkey.ab = 'guess';    
  temp.ab = C2K(27.7);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 29*365; units.am = 'd';   label.am = 'life span';                bibkey.am = 'JacoBenn2011';   
  temp.am = C2K(27.7); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 18; units.Lb  = 'cm';  label.Lb  = 'disc width at birth';   bibkey.Lb  = 'fishbase';
  comment.Lb = '17-19 cm';
data.Lp  = 47; units.Lp  = 'cm';  label.Lp  = 'disc width at puberty'; bibkey.Lp  = 'JacoBenn2011';
data.Lpm  = 47; units.Lpm  = 'cm';  label.Lpm  = 'total length at puberty for males'; bibkey.Lpm  = 'JacoBenn2011';
data.Li  = 78.2;   units.Li  = 'cm';  label.Li  = 'ultimate disc width';   bibkey.Li  = 'JacoBenn2011';
data.Lim  = 66;   units.Lim  = 'cm';  label.Lim  = 'ultimate disc width for males';   bibkey.Lim  = 'JacoBenn2011';

data.Wwi = 12e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'JacoBenn2011';
data.Wwim = 8200; units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';     bibkey.Wwim = 'JacoBenn2011';

data.Ri  = 3/365/2; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(27.7); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1-3 pups per litter, assumed 1 litter per 2 yr';
  
% uni-variate data
% time-length
data.tL_f = [ ... % time since birth (yr), disc width (cm)
0.000	17.511
0.000	19.914
0.482	19.742
0.643	19.399
1.018	23.176
1.018	22.661
1.018	21.803
1.018	21.288
1.179	24.549
1.447	20.429
1.554	27.296
1.554	24.721
1.554	19.571
2.037	27.296
2.037	25.064
2.037	21.116
2.037	22.318
2.144	20.601
2.948	32.275
3.002	22.833
3.002	23.863
3.002	25.408
3.002	26.781
3.002	27.811
3.538	28.498
3.966	20.944
4.609	30.043
4.985	32.790
4.985	29.013
4.985	28.155
5.038	30.901
5.413	35.536
5.413	30.215
5.467	38.970
5.628	40.515
5.896	35.021
5.949	27.296
6.003	32.103
6.110	33.648
6.378	34.850
6.539	40.000
7.075	33.648
7.933	35.365
7.986	41.030
9.058	40.515
9.916	45.322
10.505	42.575
12.006	42.918
13.025	46.695
13.882	53.734
13.989	58.369
13.989	45.150
14.043	46.524
15.061	47.039
15.115	44.807
16.080	47.897
17.044	51.330
18.009	68.155
18.492	71.073
19.028	58.369
19.939	49.957
19.992	53.562
20.100	60.429
21.440	53.219
21.600	60.258
21.975	63.348
23.047	64.034
23.959	62.833
24.012	70.386
25.031	69.013
25.084	52.704
28.032	68.841
29.051	78.283];
data.tL_f(:,1) = 365 * (0 + data.tL_f(:,1)); % convert yr to d
n=size(data.tL_f,1); for i=2:n; if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3; end; end
units.tL_f = {'d', 'cm'};  label.tL_f = {'time since birth', 'disc width', 'female'};  
temp.tL_f = C2K(22); units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'JacoBenn2011';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), disc width (cm)
0.375	17.854
0.375	20.944
1.018	27.639
1.179	19.227
1.554	25.408
2.358	24.721
3.002	30.386
3.002	29.185
3.055	21.116
3.859	26.094
3.859	23.004
3.966	29.013
4.020	36.567
4.449	25.923
4.556	24.034
4.931	27.296
5.521	26.781
5.574	31.931
5.842	48.240
5.896	36.567
5.896	37.768
5.949	40.687
5.949	42.403
7.450	38.455
7.933	33.305
8.040	43.262
8.254	36.738
8.576	33.820
8.951	42.232
8.951	36.395
11.417	45.665
11.899	63.348
12.006	53.562
12.060	55.107
13.132	42.403
13.882	55.107
14.043	56.996
14.096	61.116
14.525	53.047
15.008	63.348
15.222	49.614
15.919	47.210
15.972	50.472
18.545	66.094
19.081	54.421];
data.tL_m(:,1) = 365 * (0 + data.tL_m(:,1)); % convert yr to d
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
units.tL_m = {'d', 'cm'};  label.tL_m = {'time since birth', 'disc width', 'male'};  
temp.tL_m = C2K(22); units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'JacoBenn2011';
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
weights.Li = 3 * weights.Li;
weights.Lim = 3 * weights.Lim;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M = 2 * weights.psd.p_M;
weights.psd.v = 3 * weights.psd.v;
weights.psd.k_J = 0; weights.psd.k = 0.2;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 

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
F1 = 'length-weight: Ww in g =  1.827e-5*(DW in mm)^3.058';
metaData.bibkey.F1 = 'JacoBenn2011';
F2 = 'ovoviviparous';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '3XDNJ'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '51263505'; % Ency of Life
metaData.links.id_Wiki = 'Maculabatis_astra'; % Wikipedia
metaData.links.id_ADW = 'Himantura_astra'; % ADW
metaData.links.id_Taxo = '5487393'; % Taxonomicon
metaData.links.id_WoRMS = '1042866'; % WoRMS
metaData.links.id_fishbase = 'Maculabatis-astra'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Maculabatis_astra}}'; 
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
bibkey = 'JacoBenn2011'; type = 'Article'; bib = [ ... 
'doi = {10.1111/j.1095-8649.2011.02933.x}, ' ...
'author = {I. P. Jacobsen and M. B. Bennett}, ' ...
'year = {2011}, ' ...
'title  = {Life history of the blackspotted whipray \emph{Himantura astra}}, ' ...
'journal = {Journal of Fish Biology}, ' ...
'volume = {78}, ' ...
'pages = {1249-1268}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Maculabatis-astra.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  