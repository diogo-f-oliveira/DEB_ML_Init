function [data, auxData, metaData, txtData, weights] = mydata_Lycodes_raridens

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Zoarcidae';
metaData.species    = 'Lycodes_raridens'; 
metaData.species_en = 'Marbled eelpout'; 

metaData.ecoCode.climate = {'ME'};
metaData.ecoCode.ecozone = {'MN', 'MPN'};
metaData.ecoCode.habitat = {'0iMcd'};
metaData.ecoCode.embryo  = {'Mnfm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};
metaData.T_typical  = C2K(-0.5); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Ri'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};    
metaData.date_subm  = [2019 03 25];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 07];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 07];

%% set data
% zero-variate data

data.am = 8*365;  units.am = 'd';    label.am = 'life span';               bibkey.am = 'BalaBada2006';   
  temp.am = C2K(-0.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'White Sea';
  
data.Lp  = 63.5;   units.Lp  = 'cm';   label.Lp  = 'total length at puberty for female';  bibkey.Lp  = 'BalaBada2006'; 
data.Lpm  = 60;    units.Lpm  = 'cm';  label.Lpm  = 'total length at puberty for male';   bibkey.Lpm  = 'BalaBada2006'; 
data.Li  = 86;     units.Li  = 'cm';   label.Li  = 'ultimate total length for female';    bibkey.Li  = 'BalaBada2006';
  
data.Wwb = 0.113;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';        bibkey.Wwb = 'BalaBada2006';
  comment.Wwb = 'based on egg diameter of 6 mm: pi/6*0.6^3';

data.Ri  = 3116/365; units.Ri  = '#/d'; label.Ri  = 'max reprod rate';    bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(-0.5); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% univariate data
% time-length
data.tL_f = [ ... % time since birth (yr), total length (cm)
    1 15.6
    3 36.0
    4 41.9
    5 58.9
    6 73.5
    7 86.0];
data.tL_f(:,1) = 365 * (0.5 + data.tL_f(:,1)); % convert yr 
units.tL_f  = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f   = C2K(3.6);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'BalaBada2006';
comment.tL_f = 'data for females';
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
    2 22.3
    3 34.1
    4 45.9
    5 49.8
    6 63.5];
data.tL_m(:,1) = 365 * (0.5 + data.tL_m(:,1)); % convert yr 
units.tL_m  = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m   = C2K(3.6);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'BalaBada2006';
comment.tL_m = 'data for males';

% time-weight
data.tW_f = [ ... % time since birth (yr), wet weight (g)
    1 18
    3 306
    4 457
    5 1238
    6 2603
    7 4505];
data.tW_f(:,1) = 365 * (0.5 + data.tW_f(:,1)); % convert yr 
units.tW_f  = {'d', 'g'};  label.tW_f = {'time since birth', 'wet weight', 'female'};  
temp.tW_f   = C2K(3.6);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'BalaBada2006';
comment.tW_f = 'data for females';
%
data.tW_m = [ ... % time since birth (yr), wet weight (g)
    2 62
    3 233
    4 618
    5 664
    6 1720];
data.tW_m(:,1) = 365 * (0.5 + data.tW_m(:,1)); % convert yr 
units.tW_m  = {'d', 'g'};  label.tW_m = {'time since birth', 'wet weight', 'male'};  
temp.tW_m   = C2K(3.6);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'BalaBada2006';
comment.tW_m = 'data for males';
 
%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.kap = 3 * weights.psd.kap;

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
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00251*(TL in cm)^3.23';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Acknowledgment
metaData.acknowledgment = 'The creation of this entry was supported by the Norwegian Science Council (NFR 255295)';

%% Links
metaData.links.id_CoL = '3WKY6'; % Cat of Life
metaData.links.id_ITIS = '165267'; % ITIS
metaData.links.id_EoL = '46574882'; % Ency of Life
metaData.links.id_Wiki = 'Lycodes'; % Wikipedia
metaData.links.id_ADW = 'Lycodes_raridens'; % ADW
metaData.links.id_Taxo = '179366'; % Taxonomicon
metaData.links.id_WoRMS = '254598'; % WoRMS
metaData.links.id_fishbase = 'Lycodes-raridens'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lycodes}}';
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
bibkey = 'BalaBada2006'; type = 'Article'; bib = [ ... 
'author = {A. A. Balanov and O. Z. Badaev and V. V. Napazakov and V. I. Chuchukalo}, ' ... 
'year = {2006}, ' ...
'title = {Distribution and Some Biological Features of \emph{Lycodes raridens} ({Z}oarcidae) in the Western Part of the {B}ering {S}ea}, ' ...
'journal = {Journal of Ichthyology}, ' ...
'volume = {46}, ' ...
'pages = {148-155}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Lycodes-raridens.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
