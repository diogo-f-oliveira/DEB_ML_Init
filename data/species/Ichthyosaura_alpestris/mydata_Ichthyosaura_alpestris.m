function [data, auxData, metaData, txtData, weights] = mydata_Ichthyosaura_alpestris

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Caudata'; 
metaData.family     = 'Salamandridae';
metaData.species    = 'Ichthyosaura_alpestris'; 
metaData.species_en = 'Alpine newt'; 

metaData.ecoCode.climate = {'Cfb', 'Dfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0jFp', 'jiTh', 'jiFm'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {'TT'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(12); % K, body temp 
metaData.data_0     = {'am'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 06 12];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 08];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 08];

%% set data
% zero-variate data

data.am = 20 * 365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'MiauGuye2000';   
  temp.am = C2K(12);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lj  = 1.83;    units.Lj  = 'cm';  label.Lj  = 'SVL at metam for females';   bibkey.Lj  = 'MiauGuye2000';
data.Lp  = 4.9;    units.Lp  = 'cm';  label.Lp  = 'SVL at puberty for females';   bibkey.Lp  = 'MiauGuye2000';
data.Lpm  = 4.4;    units.Lpm = 'cm';  label.Lpm = 'SVL at puberty for males';   bibkey.Lpm  = 'MiauGuye2000';
data.Li  = 5.84;    units.Li  = 'cm';  label.Li  = 'ultimate SVL for females';   bibkey.Li  = 'MiauGuye2000';
data.Lim = 5.05;    units.Lim = 'cm';  label.Lim = 'ultimate SVL for males';     bibkey.Lim  = 'MiauGuye2000';

data.Wwb = 3.5e-3; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';        bibkey.Wwb = 'guess';
   comment.Wwb = 'based on Triturus cristatus';
data.Wwi = 3.16;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';        bibkey.Wwi = 'guess';
   comment.Wwi = 'based on Triturus cristatus:(5.84/8.4)^3*9.4';
data.Wwim = 2.04;   units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';     bibkey.Wwim = 'guess';
   comment.Wwim = 'based on Triturus cristatus: (5.05/8.4)^3*9.4';

data.Ri  = 300/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'guess';   
temp.Ri = C2K(12); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
comment.Ri = 'based on Lissotriton_vulgaris' ;

% univariate data
% time-length data
data.tL_f = [ ... % time since metam (yr), SVL (cm)
0.000	1.847
8.998	5.699
9.984	5.687
9.985	5.786
10.970	5.741
10.970	5.784
10.971	5.850
11.957	5.882
11.958	6.013
11.981	5.827
12.966	5.782
12.992	5.913
12.993	6.001
14.027	5.868
14.028	5.923
14.988	5.867
14.989	5.977
16.000	6.052
16.024	5.943
16.984	5.799
18.982	5.994];
data.tL_f(:,1) = data.tL_f(:,1) * 365; % convert yr to d 
units.tL_f  = {'d', 'cm'};  label.tL_f = {'time since metam', 'SVL', 'female'};  
temp.tL_f   = C2K(12);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'MiauGuye2000';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since metam (yr), SVL (cm)
0.000	1.891
11.011	4.898
11.012	4.953
11.038	5.139
11.972	4.941
11.998	5.039
11.999	5.171
12.984	5.071
13.008	5.038
13.009	5.137
13.994	5.059
13.995	5.146
15.004	4.992
15.992	5.199
16.015	5.089
16.953	5.187
19.960	5.282];
data.tL_m(:,1) = data.tL_m(:,1) * 365; % convert yr to d 
units.tL_m  = {'d', 'cm'};  label.tL_m = {'time since metam', 'SVL', 'male'};  
temp.tL_m   = C2K(12);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'MiauGuye2000';
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 10 * weights.tL_f;
weights.tL_m = 10 * weights.tL_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.v = 5 *  weights.psd.v;

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
D2 = 'Temperatures are guessed';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);  

%% Facts
% F1 = '';
% metaData.bibkey.F1 = ''; 
% metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6N65G'; % Cat of Life
metaData.links.id_ITIS = '775917'; % ITIS
metaData.links.id_EoL = '330758'; % Ency of Life
metaData.links.id_Wiki = 'Ichthyosaura_alpestris'; % Wikipedia
metaData.links.id_ADW = 'Ichthyosaura_alpestris'; % ADW
metaData.links.id_Taxo = '1397948'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_amphweb = 'Ichthyosaura+alpestris'; % AmphibiaWeb
metaData.links.id_AnAge = 'Ichthyosaura_alpestris'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Ichthyosaura_alpestris}}';
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
bibkey = 'MiauGuye2000'; type = 'article'; bib = [ ...
'author = {Claude Miaud and Robert Guyetant and Helmut Faber}, ' ... 
'year = {2000}, ' ...
'title = {Age, size, and growth of the {A}lpine newt, \emph{Triturus alpestris} ({U}rodela: {S}alamandridae), at high altitude and a review of life-history trait variation throughout its range}, ' ...
'journal = {Herpetologica}, ' ...
'volume = {56(2)}, ' ...
'pages = {135-144}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

