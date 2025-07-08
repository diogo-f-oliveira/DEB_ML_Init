function [data, auxData, metaData, txtData, weights] = mydata_Rana_amurensis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Anura'; 
metaData.family     = 'Ranidae';
metaData.species    = 'Rana_amurensis'; 
metaData.species_en = 'Siberian wood frog'; 

metaData.ecoCode.climate = {'BSk', 'BWk', 'Dw'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0jFp', 'jiTf', 'jiTg'};
metaData.ecoCode.embryo  = {'Fpf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjO', 'jiCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(17); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.2; % using criteria of LikaKear2011

metaData.author     = {'Bas Kooijman'};    
metaData.date_subm  = [2019 06 11];              
metaData.email      = {'bas.kooijman@vu.nl'};            
metaData.address    = {'VU University, Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 08];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 08];

%% set data
% zero-variate data

data.tp = 1*365;  units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'Liao2011';
  temp.tp = C2K(17);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 11*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'amphibiaweb';   
  temp.am = C2K(17);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 3.95;    units.Lp  = 'cm';  label.Lp  = 'SVL at puberty for females';   bibkey.Lp  = 'Liao2011';
data.Lpm  = 4.25;    units.Lpm  = 'cm';  label.Lpm  = 'SVL at puberty for males';   bibkey.Lpm  = 'Liao2011';
data.Li  = 6.77;    units.Li  = 'cm';  label.Li  = 'ultimate SVL for females';   bibkey.Li  = 'Liao2011';
data.Lim  = 6.06;    units.Lim  = 'cm';  label.Lim  = 'ultimate SVL for males';   bibkey.Lim  = 'Liao2011';

data.Wwb = 0.0042;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'guess based on Anaxyrus americanus';
data.Wwp = 14.9;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty for females';     bibkey.Wwp = 'guess';
  comment.Wwp = 'guess based on length-weight of Rana muscosa: (3.95/6.8)^3*76';
data.Wwi = 75;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = 'guess';
  comment.Wwi = 'guess based on length-weight of Rana muscosa: (6.77/6.8)^3*76';
data.Wwim = 53.7;  units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';     bibkey.Wwim = 'guess';
  comment.Wwim = 'guess based on length-weight of Rana muscosa: (6.06/6.8)^3*76';

data.Ri  = 4000/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'amphibiaweb';   
  temp.Ri = C2K(17);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '250 to 4000 eggs in 1 or 2 clutches per yr';
  
% univariate data
% time-length data
data.tL_f = [ ... % time since birth (yr), SVL (cm)
1 3.95
2 4.17
3 4.88
4 5.84];
data.tL_f(:,1) = (0.8 + data.tL_f(:,1)) * 365; % convert yr since birth to d since puberty
units.tL_f  = {'d', 'cm'};  label.tL_f = {'time since birth', 'SVL', 'female'};  
temp.tL_f   = C2K(17);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Liao2011';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), SVL (cm)
1 4.25
2 4.69
3 5.20
4 5.52];
data.tL_m(:,1) = (0.8 + data.tL_m(:,1)) * 365; % convert yr since birth to d since puberty
units.tL_m  = {'d', 'cm'};  label.tL_m = {'time since birth', 'SVL', 'male'};  
temp.tL_m   = C2K(17);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Liao2011';
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 10 * weights.tL_f;
weights.tL_m = 10 * weights.tL_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 1 * weights.psd.v;
weights.psd.p_M = 1 * weights.psd.p_M;

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
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'Temperature ranges from -25.7 to 22.8 C, mean 2.4 C';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);  


%% Facts
% F1 = '';
% metaData.bibkey.F1 = ''; 
% metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4RDGX'; % Cat of Life
metaData.links.id_ITIS = '665258'; % ITIS
metaData.links.id_EoL = '313551'; % Ency of Life
metaData.links.id_Wiki = 'Rana_amurensis'; % Wikipedia
metaData.links.id_ADW = 'Rana_amurensis'; % ADW
metaData.links.id_Taxo = '145403'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_amphweb = 'Rana+amurensis'; % AmphibiaWeb
metaData.links.id_AnAge = 'Rana_amurensis'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Rana_amurensis}}';
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
bibkey = 'Liao2011'; type = 'Article'; bib = [ ... 
'author = {Wen Bo Liao}, ' ... 
'year = {2011}, ' ...
'title = {A skeletochronological estimate of age in a population of the {S}iberian Wood Frog, \emph{Rana amurensis}, from northeastern {C}hina}, ' ...
'journal = {Acta Herpetologica}, ' ...
'volume = {6(2)}, ' ...
'pages = {237-245}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{http://amphibiaweb.org/cgi/amphib_query?rel-common_name=like&where-scientific_name=Rana+amurensis}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

