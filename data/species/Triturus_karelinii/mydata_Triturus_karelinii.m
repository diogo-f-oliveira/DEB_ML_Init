function [data, auxData, metaData, txtData, weights] = mydata_Triturus_karelinii

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Caudata'; 
metaData.family     = 'Salamandridae';
metaData.species    = 'Triturus_karelinii'; 
metaData.species_en = 'Southern crested newt'; 

metaData.ecoCode.climate = {'Cfa', 'Cfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0jFp', 'jiTh', 'jiTf'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(13); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am';  'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 1.9; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                        
metaData.date_subm = [2019 06 28];                            
metaData.email    = {'bas.kooijman@vu.nl'};                   
metaData.address  = {'VU University, 1818HV Amsterdam, the Netherlands'};        

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 08];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 08];

%% set data
% zero-variate data;
data.ab = 25;      units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'amphibiaweb';    
  temp.ab = C2K(13); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '12 to 20 d';
data.tp = 2.5*365;     units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'OlguUzum2005';
  temp.tp = C2K(13);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 11*365;  units.am = 'd';    label.am = 'life span';                   bibkey.am = 'EoL';   
  temp.am = C2K(13);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp  = 5.4;    units.Lp  = 'cm';  label.Lp  = 'SVL at puberty';    bibkey.Lp  = 'OlguUzum2005';
data.Li  = 9.9;   units.Li  = 'cm';  label.Li  = 'ultimate SVL';      bibkey.Li  = 'OlguUzum2005';
data.Lim  = 9.99;   units.Lim  = 'cm';  label.Lim  = 'ultimate SVL';      bibkey.Lim  = 'OlguUzum2005';

data.Wwb = 3.5e-3; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';        bibkey.Wwb = 'guess';
  comment.Wwb = 'based on Triturus cristatus'; 
data.Wwp = 1.72;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';      bibkey.Wwp = 'guess';
  comment.Wwp = 'based on from (Lp/L_m)^3*Wwi';
data.Wwi = 10.6;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for female'; bibkey.Wwi = 'guess';
  comment.Wwi = 'based on length-weight of Triturus cristatus';
data.Wwim = 10.9;   units.Wwim = 'g';   label.Wwim = 'ultimate wet weight';        bibkey.Wwim = 'guess';
  comment.Wwim = 'based on (Lim/Li)^3*Wwi';

data.Ri  = 600/365;units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';        bibkey.Ri  = 'amphibiaweb';   
  temp.Ri = C2K(13); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Truturus cristatus: 70-600 egg per clutch, 1 clutch per yr';

% univariate data
% time-length
data.tL_f = [ ... % time since birth (yr), SVL  (cm)
0.992	3.876
0.993	3.997
1.005	3.769
1.017	3.581
1.982	3.997
1.982	4.117
2.007	3.889
2.008	4.238
2.008	4.506
2.009	5.229
2.021	4.640
4.003	6.395
4.003	6.623
4.029	7.012
5.005	6.302
5.006	7.012
5.017	6.020
5.995	7.012
5.997	7.843
6.009	7.601
6.020	6.516
6.022	8.003
6.986	8.124
6.987	8.191
8.013	7.816];
data.tL_f(:,1) = 365 * data.tL_f(:,1);
units.tL_f  = {'d', 'cm'};  label.tL_f = {'time since birth', 'SVL', 'female'};  
temp.tL_f   = C2K(13);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'OlguUzum2005';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), SVL  (cm)
3.000	6.235
3.012	5.524
3.013	5.993
4.028	6.503
5.005	7.173
5.006	7.320
5.007	7.494
6.009	7.481
6.023	8.714
7.010	6.730
7.012	8.017
7.024	7.615
8.000	7.588
8.002	8.526
8.015	8.982
11.009	8.982];
data.tL_m(:,1) = 365 * data.tL_m(:,1);
units.tL_m  = {'d', 'cm'};  label.tL_m = {'time since birth', 'SVL', 'male'};  
temp.tL_m   = C2K(13);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'OlguUzum2005';
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);

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
D1 = 'Temperatures are guessed';
D2 = 'Males are assumed to differ from females by {p_Am} only';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);  

%% Links
metaData.links.id_CoL = '595FG'; % Cat of Life
metaData.links.id_ITIS = '1106485'; % ITIS
metaData.links.id_EoL = '1048229'; % Ency of Life
metaData.links.id_Wiki = 'Triturus_karelinii'; % Wikipedia
metaData.links.id_ADW = 'Triturus_karelinii'; % ADW
metaData.links.id_Taxo = '151425'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_amphweb = 'Triturus+karelinii'; % AmphibiaWeb

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Triturus_karelinii}}';   
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
bibkey = 'OlguUzum2005'; type = 'Article'; bib = [ ...  
'author = {Kurtulus Olgun and Nazan Uzum and Aziz Avci and Claude Miaud}, ' ...
'title = {Age, size and growth of the southern crested newt \emph{Triturus karelinii} ({S}trauch 1870) in a population from {B}ozdag (Western {T}urkey)}, ' ...
'journal = {Amphibia-Reptilia}, ' ...
'volume = {26}, ' ...
'pages = {223-230}, ' ...
'year = {2005}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{https://eol.org/pages/1048229/articles}}';   
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{http://amphibiaweb.org/cgi/amphib_query?rel-common_name=like&where-scientific_name=Triturus+karelinii}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

