function [data, auxData, metaData, txtData, weights] = mydata_Leucoraja_wallacei

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Rajiformes'; 
metaData.family     = 'Rajidae';
metaData.species    = 'Leucoraja_wallacei'; 
metaData.species_en = 'Yellowspotted skate'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MASE'};
metaData.ecoCode.habitat = {'0iMcd'};
metaData.ecoCode.embryo  = {'Ms'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(11.3); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2020 11 05];                          
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
data.ab = 1.3*365; units.ab = 'd';    label.ab = 'age at birth';               bibkey.ab = 'guess';   
  temp.ab = C2K(11.3); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 15*365; units.am = 'd';    label.am = 'life span';               bibkey.am = 'WalmSaue1999';   
  temp.am = C2K(11.3); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 12;   units.Lb  = 'cm';  label.Lb  = 'disc width at birth'; bibkey.Lb  = 'WalmSaue1999';
data.Lp  = 33.8;   units.Lp  = 'cm';  label.Lp  = 'disc width at puberty for females';   bibkey.Lp  = 'WalmSaue1999';
data.Lpm = 39.5;    units.Lpm  = 'cm';  label.Lpm  = 'disc width at puberty  for males';   bibkey.Lpm  = 'WalmSaue1999';
data.Li  = 43.5; units.Li  = 'cm';  label.Li  = 'ultimate disc width for females';   bibkey.Li  = 'WalmSaue1999';
  comment.Li = 'TL 90.4 cm from photo';
data.Lim  = 40.5; units.Lim  = 'cm';  label.Lim  = 'ultimate disc width for males';   bibkey.Lim  = 'WalmSaue1999';

data.Wwi = 8.3e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = {'WalmSaue1999','fishbase'};
  comment.Wwi = 'based on 0.00575*Li^3.15, see F1, ';

data.Ri  = 8/365; units.Ri  = '#/d';label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'guess';   
  temp.Ri = C2K(11.3); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on kappa';

% uni-variate data at f
data.tL_f = [ ... % time since birth (yr), disc width (cm)
1.860	25.745
1.910	19.312
1.910	18.525
1.911	16.161
1.934	17.868
1.934	17.212
1.934	16.818
1.954	27.453
1.959	15.111
2.926	21.682
2.949	25.227
2.995	27.985
3.018	28.379
3.874	20.901
3.895	26.678
3.896	24.840
3.913	40.463
3.918	28.122
3.918	27.334
3.920	23.921
4.931	39.157
4.932	37.056
4.953	45.197
4.953	44.278
4.953	43.490
4.954	41.652
4.958	32.987
4.959	29.704
4.961	24.321
4.961	23.928
4.962	22.746
4.963	18.676
4.983	27.341
4.984	26.422
5.005	31.543
5.027	35.744
5.927	34.437
5.927	34.175
5.928	33.649
5.951	35.225
5.967	52.687
5.975	32.599
5.995	42.709
5.996	39.558
6.919	40.746
6.920	38.908
6.940	47.967
7.912	44.166
7.912	42.459
7.937	40.621
7.940	32.481
7.941	31.037
8.931	39.183
8.932	37.345
8.936	27.105
9.921	50.612
9.924	44.179
9.924	41.684
9.955	25.405
10.919	41.560
14.941	43.818];
data.tL_f(:,1) = 365 * data.tL_f(:,1); % convert yr to d
n=size(data.tL_f,1); for i=2:n; if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3; end; end
units.tL_f = {'d', 'cm'};  label.tL_f = {'time since birth', 'disc width', 'female'};  
temp.tL_f = C2K(11.3); units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'WalmSaue1999';
comment.tL_f = 'data for females';
%
data.tL_m = [ ... % time since birth (yr), disc width (cm)
1.959	14.324
1.979	24.039
2.005	17.737
2.028	19.838
2.051	20.364
2.052	18.394
2.927	20.501
2.927	19.450
2.928	17.744
2.997	22.733
3.020	24.965
3.895	27.597
3.895	26.940
3.945	19.720
3.966	25.496
3.967	24.577
3.985	39.020
3.985	38.232
3.987	34.162
4.014	23.659
4.015	22.215
4.016	20.902
4.907	41.258
4.929	44.409
4.932	38.501
4.932	36.663
4.933	35.744
4.933	34.299
4.934	33.643
4.935	28.916
4.978	39.945
4.982	31.936
5.880	35.487
5.901	42.183
5.908	22.358
5.953	30.105
5.953	29.186
5.973	39.689
6.966	40.615
6.968	35.232
6.973	23.416
6.988	45.473
6.991	37.201
6.996	25.648
7.011	46.786
7.889	41.146
7.938	36.814
7.939	36.157
7.940	31.562
7.942	26.836
8.954	41.284
8.955	38.790
8.957	33.669
8.962	22.772
9.928	33.938
9.952	32.100
9.989	57.571];
data.tL_m(:,1) = 365 * data.tL_m(:,1); % convert yr to d
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
units.tL_m = {'d', 'cm'};  label.tL_m = {'time since birth', 'disc width', 'male'};  
temp.tL_m = C2K(11.3); units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'WalmSaue1999';
comment.tL_m = 'data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 10 * weights.tL_f;
weights.tL_m = 10 * weights.tL_m;
weights.ab = 0 * weights.ab;

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
D1 = 'males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00575*(PL in cm)^3.13';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6Q69H'; % Cat of Life
metaData.links.id_ITIS = '564225'; % ITIS
metaData.links.id_EoL = '46560526'; % Ency of Life
metaData.links.id_Wiki = 'Leucoraja'; % Wikipedia
metaData.links.id_ADW = 'Leucoraja_wallacei'; % ADW
metaData.links.id_Taxo = '108271'; % Taxonomicon
metaData.links.id_WoRMS = '217396'; % WoRMS
metaData.links.id_fishbase = 'Leucoraja-wallacei'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Leucoraja}}'; 
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
bibkey = 'WalmSaue1999'; type = 'Article'; bib = [ ... 
'doi = {10.1080/00288330.2001.9517045}, ' ...
'author = {S. A. Walmsley-Hart and W. H. H. Sauer and C. D. Buxton}, ' ...
'year = {1999}, ' ...
'title  = {THE BIOLOGY OF THE SKATES \emph{Raja wallacei} AND \emph{R. pullopunctata} ({B}ATOIDEA: {R}AJIDAE) ON THE {A}GULHAS {B}ANK, {S}OUTH {A}FRICA}, ' ...
'journal = {S. Afr. J. mar. Sci.}, ' ...
'volume = {21}, ' ...
'pages = {165-179}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Leucoraja-wallacei.html}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

