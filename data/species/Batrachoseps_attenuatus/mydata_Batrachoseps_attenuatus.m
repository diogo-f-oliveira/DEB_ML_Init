function [data, auxData, metaData, txtData, weights] = mydata_Batrachoseps_attenuatus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Caudata'; 
metaData.family     = 'Plethodontidae';
metaData.species    = 'Batrachoseps_attenuatus'; 
metaData.species_en = 'California slender salamander'; 

metaData.ecoCode.climate = {'Cs'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0jFc', 'jiTf'};
metaData.ecoCode.embryo  = {'Tns'};
metaData.ecoCode.migrate = {'TT'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 01 15];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 01 15];

%% set data
% zero-variate data

data.ab = 80;      units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = '';   
  temp.ab = C2K(14);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 3*365;  units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'ADW';
  temp.tp = C2K(14);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 8*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'ADW';   
  temp.am = C2K(15);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Li  = 5.5;    units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'ADW';

data.Wwb = 0.0654;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 5 mm: pi/6*0.5^3';
data.Wwi = 2.47;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = 'EoL';

data.Ri  = 10/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(14);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '5-20 eggs per clutch, 1 clutch each yr assumed; several inidivudlas can contribute to a clutch';

% univariate data
% time-length
data.tL_f = [ ... % time since birth (yr), SVL (cm)
3	4.492
4	4.560
4	4.233
4	4.199
4	4.148
4	3.910
4	4.284
5	4.111
5	3.965
5	4.599
5	4.291
5	4.231
5	4.206
5	3.930
5	3.768
7	4.208
7	4.699];
data.tL_f(:,1) = (data.tL_f(:,1) + 0.8) * 365; % convert yr to d
units.tL_f  = {'d', 'cm'}; label.tL_f = {'time since birth', 'SVL', 'female'};  
temp.tL_f   = C2K(14); units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'WakeCast1995';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), SVL (cm)
3	3.919
3	3.589
4	4.620
6	4.647
6	4.400];
data.tL_m(:,1) = (data.tL_m(:,1) + 0.8) * 365; % convert yr to d
units.tL_m  = {'d', 'cm'}; label.tL_m = {'time since birth', 'SVL', 'male'};  
temp.tL_m   = C2K(14); units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'WakeCast1995';
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;
%weights.Li = 5 * weights.Li;
%weights.Wwi = 5 * weights.Wwi;
weights.Wwb = 5 * weights.Wwb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f', 'tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by E_Hm and {p_Am} only';
D2 = 'LdL data are ignored';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts
F1 = 'Males slightly smaller than females';
metaData.bibkey.F1 = 'EoL'; 
metaData.facts = struct('F1',F1);

%% Acknowledgment
metaData.acknowledgment = 'Eric Liebgold kindly helped collecting data for this entry';

%% Links
metaData.links.id_CoL = '5WG5X'; % Cat of Life
metaData.links.id_ITIS = '173706'; % ITIS
metaData.links.id_EoL = '330263'; % Ency of Life
metaData.links.id_Wiki = 'Batrachoseps_attenuatus'; % Wikipedia
metaData.links.id_ADW = 'Batrachoseps_attenuatus'; % ADW
metaData.links.id_Taxo = '47458'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_amphweb = 'Batrachoseps+attenuatus'; % AmphibiaWeb
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Batrachoseps_attenuatus}}';
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
bibkey = 'WakeCast1995'; type = 'Article'; bib = [ ... 
'author = {David B. Wake and Jacques Castan}, ' ... 
'year = {1995}, ' ...
'title = {A Skeletochronological Study of Growth and Age in Relation to Adult Size in \emph{Batrachoseps attenuatus}}, ' ...
'journal = {Journal of Herpetology}, ' ...
'volume = {29(1)}, ' ...
'pages = {60-65}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{http://amphibiaweb.org/cgi/amphib_query?rel-common_name=like&where-scientific_name=Batrachoseps+attenuatus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{http://eol.org/pages/330263/details}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Batrachoseps_attenuatus/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

