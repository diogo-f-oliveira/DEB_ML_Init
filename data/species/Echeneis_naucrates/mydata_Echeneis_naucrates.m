function [data, auxData, metaData, txtData, weights] = mydata_Echeneis_naucrates

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Carangiformes'; 
metaData.family     = 'Echeneidae';
metaData.species    = 'Echeneis_naucrates'; 
metaData.species_en = 'Live sharksucker'; 

metaData.ecoCode.climate = {'MA', 'MB'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCvf', 'jiSvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.2); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2019 02 10];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University, Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 03];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 03];

%% set data
% zero-variate data

data.am = 11 * 365;     units.am = 'd';      label.am = 'life span';        bibkey.am = 'BachKrau2018';   
  temp.am = C2K(27.2);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 40;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'ADW'; 
  comment.Lp = 'based on ap of 3 to 5 yrs and tL data';
data.Li  = 110;   units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'fishbase';

data.Wwb = 1.2e-3; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'BachKrau2018';
  comment.Wwb = 'based on egg diameter of 1040 and 1623 ?m: pi/6*0.13^3';
data.Wwi = 2.3e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';

data.Ri = 4e4/365;units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';      bibkey.Ri  = 'BachKrau2018';   
  temp.Ri = C2K(27.2); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
comment.Ri = '10192 to 42151 eggs per yr';
 
% uni-variate data
% time-length
data.tL_f =	[ ... % time since birth (yr), total length (cm)
0.245	11.707
0.245	11.220
0.226	14.146
0.207	7.317
0.207	8.293
0.207	12.073
0.094	9.268
0.094	11.463
0.094	15.244
0.094	17.317
0.075	8.293
0.056	5.610
0.056	12.561
0.038	6.707
0.038	7.927
0.019	3.415
0.000	10.732
0.094	14.146
0.113	13.171
0.132	7.683
0.207	12.439
0.207	11.707
0.245	16.098
0.282	13.780
0.829	19.878
0.847	18.902
0.885	15.122
1.036	19.756
1.168	22.927
1.205	23.902
1.714	34.268
1.751	25.976
1.751	32.439
1.808	35.244
1.883	19.024
1.883	37.073
1.921	34.634
1.940	32.195
1.940	36.341
2.053	20.976
2.072	33.659
2.128	19.756
2.166	30.732
2.203	24.390
2.222	21.951
2.241	23.049
2.731	40.244
2.787	38.171
2.844	35.610
2.863	29.634
2.863	36.707
2.881	43.537
2.900	36.098
2.919	33.902
2.938	34.756
3.051	39.878
3.107	34.390
3.107	44.634
3.126	38.902
3.145	40.244
3.145	47.317
3.785	51.220
3.842	39.146
3.955	49.268
3.974	36.585
4.030	47.195
4.049	44.634
4.049	40.000
4.068	52.195
4.068	49.756
4.200	42.317
4.218	45.488
4.878	33.659
4.953	53.049
5.047	42.927
5.141	50.000
5.876	52.439
5.932	45.488
6.008	51.829
6.893	41.707
7.043	43.902
7.928	53.293
8.832	51.829
8.870	72.073
9.944	46.829];
data.tL_f(:,1) = (0.5 + data.tL_f(:,1)) * 365; % convert yr to d
n=size(data.tL_f,1); for i=2:n; if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3; end; end
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f    = C2K(27.2);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'BachKrau2018';
comment.tL_f = 'data for females';
%
data.tL_m =	[ ... % time since birth (yr), total length (cm)
0.132	10.122
0.132	17.561
1.017	30.610
1.036	20.488
1.092	19.146
1.111	27.073
1.168	20.000
1.186	26.341
1.770	30.000
1.864	28.659
1.864	40.366
1.902	29.878
1.921	26.341
1.996	24.390
1.996	30.488
2.015	35.854
2.053	37.439
2.109	32.683
2.109	33.171
2.128	32.195
2.147	27.927
2.166	38.049
2.203	34.390
2.825	42.317
2.863	37.927
3.070	35.732
3.145	37.195
3.202	19.024
3.804	44.878
3.823	37.561
3.861	36.463
3.898	42.073
3.917	46.463
3.974	41.098
4.011	41.463
4.049	38.171
4.124	36.951
4.124	43.659
4.237	40.000
4.727	43.049
4.783	39.634
4.802	43.537
4.840	42.073
4.859	46.098
4.896	45.366
4.934	41.098
4.953	44.390
5.141	38.293
5.160	40.854
6.177	37.805
6.817	45.244
6.874	43.049
7.175	45.976
8.041	38.049];
data.tL_m(:,1) = (0.5 + data.tL_m(:,1)) * 365; % convert yr to d
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m    = C2K(27.2);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'BachKrau2018';
comment.tL_m = 'data for males';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M = 5 * weights.psd.p_M;

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
D1 = 'FEMALE total length at maturity - NOTE L50% is decreasing over time: we chose lowest L50% in North Sea datras dataset (2008)';
D2 = 'males are assumed to differ from females by {p_Am} and E_Hp only';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);  

%% Links
metaData.links.id_CoL = '6DTSX'; % Cat of Life
metaData.links.id_ITIS = '168575'; % ITIS
metaData.links.id_EoL = '46578345'; % Ency of Life
metaData.links.id_Wiki = 'Echeneis_naucrates'; % Wikipedia
metaData.links.id_ADW = 'Echeneis_naucrates'; % ADW
metaData.links.id_Taxo = '45226'; % Taxonomicon
metaData.links.id_WoRMS = '126848'; % WoRMS
metaData.links.id_fishbase = 'Echeneis-naucrates'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Echeneis_naucrates}}';
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
bibkey = 'BachKrau2018'; type = 'Article'; bib = [ ...
'doi = {10.1111/jfb.13790}, ' ...
'author = {Beverly A. Bachman and Richard Kraus and Cheston T. Peterson and Ralph Dean Grubbs and Esther C. Peters}, ' ... 
'year = {2018}, ' ...
'title = {Growth and reproduction of \emph{Echeneis naucrates} from the eastern {G}ulf of {M}exico}, ' ...
'journal = {J Fish Biol.}, ' ...
'volume = {93}, ' ...
'pages = {755-758}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Echeneis-naucrates.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Echeneis_naucrates/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

