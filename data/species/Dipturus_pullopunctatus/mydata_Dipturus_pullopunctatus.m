function [data, auxData, metaData, txtData, weights] = mydata_Dipturus_pullopunctatus

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Rajiformes'; 
metaData.family     = 'Rajidae';
metaData.species    = 'Dipturus_pullopunctatus'; 
metaData.species_en = 'Slime skate'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MASE'};
metaData.ecoCode.habitat = {'0iMcd'};
metaData.ecoCode.embryo  = {'Ms'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(11); % K, body temp
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
data.ab = 1.8*365; units.ab = 'd';    label.ab = 'age at birth';               bibkey.ab = 'guess';   
  temp.ab = C2K(11); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 18*365; units.am = 'd';    label.am = 'life span';               bibkey.am = 'WalmSaue1999';   
  temp.am = C2K(11); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 15;   units.Lb  = 'cm';  label.Lb  = 'disc width at birth'; bibkey.Lb  = 'WalmSaue1999';
data.Lp  = 58.4;   units.Lp  = 'cm';  label.Lp  = 'disc width at puberty for females';   bibkey.Lp  = 'WalmSaue1999';
data.Li  = 132.7; units.Li  = 'cm';  label.Li  = 'ultimate disc width for females';   bibkey.Li  = 'WalmSaue1999';
  comment.Li = 'corresponds with TL 190.4 cm';
data.Lim  = 77; units.Lim  = 'cm';  label.Lim  = 'ultimate disc width for males';   bibkey.Lim  = 'WalmSaue1999';

data.Wwi = 68.6e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = {'WalmSaue1999','fishbase'};
  comment.Wwi = 'based on 0.00282*Li^3.24, see F1';

data.Ri  = 20/365; units.Ri  = '#/d';label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'guess';   
  temp.Ri = C2K(11); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on kappa';

% uni-variate data at f
data.tL_f = [ ... % time since birth (yr), disc width (cm)
0.075	14.976
0.998	17.744
0.999	17.941
1.970	18.541
2.019	23.665
2.066	24.454
2.990	26.236
3.014	28.404
3.061	29.981
3.062	31.163
3.063	33.133
3.064	36.680
3.986	32.748
4.956	31.970
4.958	39.260
4.959	40.443
4.960	42.019
4.984	44.975
5.004	35.320
5.005	37.488
5.028	33.941
6.001	46.167
6.002	48.138
6.024	41.241
6.975	57.014
7.016	36.522
7.017	38.887
7.042	43.025
7.044	48.345
7.045	51.892
7.944	50.324
7.945	55.250
7.946	57.221
7.947	59.191
7.967	47.960
7.974	72.394
7.975	75.152
7.986	33.576
9.957	53.694
9.958	55.664
10.004	52.906
10.976	58.827
14.055	66.345
14.056	66.739];
data.tL_f(:,1) = 365 * data.tL_f(:,1); % convert yr to d
units.tL_f = {'d', 'cm'};  label.tL_f = {'time since birth', 'disc width', 'female'};  
temp.tL_f = C2K(11); units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'WalmSaue1999';
comment.tL_f = 'data for females';
%
data.tL_m = [ ... % time since birth (yr), disc width (cm)
1.024	20.700
1.098	29.764
2.065	18.936
2.993	35.103
3.017	37.271
3.037	25.645
3.038	26.434
3.045	53.823
3.985	28.413
4.010	33.734
4.012	39.645
4.013	40.630
4.034	36.690
4.084	45.754
4.980	34.729
4.981	36.502
4.982	37.684
4.983	40.049
4.984	41.428
4.985	42.019
4.986	43.005
5.008	47.537
5.009	51.478
5.951	34.935
6.002	45.379
6.976	58.000
7.040	36.128
7.046	55.439
7.089	40.267
7.965	40.275
7.966	45.201
7.990	47.369
7.993	57.221
7.995	63.133
7.996	66.088
7.997	67.074
9.030	42.059
9.979	48.965
10.025	44.631
11.048	64.148
11.049	65.330
11.070	56.266
18.077	61.065];
data.tL_m(:,1) = 365 * data.tL_m(:,1); % convert yr to d
units.tL_m = {'d', 'cm'};  label.tL_m = {'time since birth', 'disc width', 'male'};  
temp.tL_m = C2K(11); units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'WalmSaue1999';
comment.tL_m = 'data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;
weights.Li = 2 * weights.Li;
weights.Lim = 2 * weights.Lim;
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
D1 = 'males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00282*(PL in cm)^3.24';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '36R4L'; % Cat of Life
metaData.links.id_ITIS = '564175'; % ITIS
metaData.links.id_EoL = '46560474'; % Ency of Life
metaData.links.id_Wiki = 'Dipturus_pullopunctatus'; % Wikipedia
metaData.links.id_ADW = 'Dipturus_pullopunctatus'; % ADW
metaData.links.id_Taxo = '173285'; % Taxonomicon
metaData.links.id_WoRMS = '217389'; % WoRMS
metaData.links.id_fishbase = 'Dipturus-pullopunctatus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Dipturus_pullopunctatus}}'; 
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
'howpublished = {\url{http://www.fishbase.org/summary/Dipturus-pullopunctatus.html}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

