function [data, auxData, metaData, txtData, weights] = mydata_Batrachocottus_baicalensis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Cottocomephoridae';
metaData.species    = 'Batrachocottus_baicalensis'; 
metaData.species_en = 'Bighead sculpin'; 

metaData.ecoCode.climate = {'Dfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fnm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(7); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Ri'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 04 24];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'}; 

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 07];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 07];

%% set data
% zero-variate data

data.am = 9 * 365; units.am = 'd';   label.am = 'life span';                 bibkey.am = 'TolmGavr2008';   
  temp.am = C2K(7);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 13;     units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'TolmGavr2008';
  comment.Lp = 'based on tp = 5 yr, from tL_f data';
data.Li  = 19;     units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 2.3e-3;     units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'baed on egg diameter of 1.63 mm of Cottus volki: pi/6*0.163^3';
 
data.Ri = 2700/365;       units.Ri = '#/d';  label.Ri = 'reprod rate';       bibkey.Ri = 'guess';
  temp.Ri = C2K(7); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on kap = 0.94, as found for  Cottus volki';

% uni-variate data
% time-length
data.tL_f = [ ... % age (years), total length (cm) 
    4 11.75
    5 13.13
    6 14.40
    7 16.22
    8 18.00];
data.tL_f(:,1) = 365 * (0.5 + data.tL_f(:,1)); % convert yr to d
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f = C2K(7);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'TolmGavr2008';
comment.tL_f = 'data for females';
%
data.tL_m = [ ... % age (years), total length (cm) 
    4 11.46
    5 12.48
    6 14.03
    8 15.30];
data.tL_m(:,1) = 365 * (0.5 + data.tL_m(:,1)); % convert yr to d
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m = C2K(7);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'TolmGavr2008';
comment.tL_m = 'data for males';

% time-weight
data.tW_f = [ ... % age (years), wet weight (g)
    4  31.5
    5  42.3
    6  72.5
    7  95.6
    8 115.2];
data.tW_f(:,1) = 365 * (0.5 + data.tW_f(:,1)); % convert yr to d
units.tW_f = {'d', 'g'}; label.tW_f = {'time since birth', 'wet weight', 'female'};  
temp.tW_f = C2K(7);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'TolmGavr2008';
comment.tW_f = 'data for females';
%
data.tW_m = [ ... % age (years), wet weight (g)
    4 29.8
    5 40.9
    6 50.87
    8 85.9];
data.tW_m(:,1) = 365 * (0.5 + data.tW_m(:,1)); % convert yr to d
units.tW_m = {'d', 'g'}; label.tW_m = {'time since birth', 'wet weight', 'male'};  
temp.tW_m = C2K(7);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'TolmGavr2008';
comment.tW_m = 'data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = weights.tL_f * 5;
weights.tL_m = weights.tL_m * 5;
weights.Ri = 0 * weights.Ri;

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
set2 = {'tW_f','tW_m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Links
metaData.links.id_CoL = 'KZGY'; % Cat of Life
metaData.links.id_ITIS = '643791'; % ITIS
metaData.links.id_EoL = '222893'; % Ency of Life
metaData.links.id_Wiki = 'Batrachocottus_baicalensis'; % Wikipedia
metaData.links.id_ADW = 'Batrachocottus_baicalensis'; % ADW
metaData.links.id_Taxo = '163953'; % Taxonomicon
metaData.links.id_WoRMS = '1020418'; % WoRMS
metaData.links.id_fishbase = 'Batrachocottus-baicalensis'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Batrachocottus_baicalensis}}';
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
bibkey = 'TolmGavr2008'; type = 'Article'; bib = [ ... 
'doi = {10.1134/S0032945208030065}, ' ...
'author = {Yu. P. Tolmacheva and A. V. Gavrilova and B. E. Bogdanov and E. V. Dzyuba and I. V. Veinberg and N. A. Rozhkova and N. V. Maksimova and L. V. Zubina}, ' ... 
'year = {2008}, ' ...
'title = {Seasonal Dynamics of Growth and Feeding of Big-headed Sculpin \emph{Batrachocottus baicalensis} ({C}ottidae) in the {C}ape {B}erezovyi {A}rea ({S}outhern {B}aikal)}, ' ...
'journal = {Journal of Ichthyology}, ' ...
'volume = {48}, ' ...
'pages = {241-248}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Batrachocottus-baicalensis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

