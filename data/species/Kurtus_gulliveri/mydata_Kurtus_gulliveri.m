function [data, auxData, metaData, txtData, weights] = mydata_Kurtus_gulliveri

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Kurtiformes'; 
metaData.family     = 'Kurtidae';
metaData.species    = 'Kurtus_gulliveri'; 
metaData.species_en = 'Nurseryfish'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MIE'};
metaData.ecoCode.habitat = {'0iMm'};
metaData.ecoCode.embryo  = {'Mbm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28); % K, body temp
metaData.data_0     = {'am'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2017 04 05];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 03];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 03];

%% set data
% zero-variate data

data.am = 4*365;   units.am = 'd';   label.am = 'life span';                 bibkey.am = 'BerrAday2004';   
  temp.am = C2K(28);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'except for ab, all temps are guessed';
  
data.Lb  = 0.69;  units.Lb  = 'cm';  label.Lb  = 'total length at birth';  bibkey.Lb  = 'BerrNeir2003'; 
data.Lj  = 2.5;   units.Lj  = 'cm';  label.Lj  = 'total length at metam';  bibkey.Lj  = 'BerrNeir2003'; 
  comment.Lj = 'based on the assumption that end of acceleration coincides with end of pelagic stage';
data.Lp  = 20;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'BerrAday2004'; 
data.Li  = 63;     units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'BerrAday2004';

data.Wwb = 6.4e-3;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'BerrNeir2003';
  comment.Wwb = 'based on egg diameter of 2.1-2.5 mm: 4/3*pi*.115^3';
data.Wwi = 5000;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'record';

data.Ri  = 1300/365; units.Ri  = '-'; label.Ri  = 'max reprod rate'; bibkey.Ri = 'BerrNeir2003';   
  temp.Ri = C2K(24); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data

% t-L data females
data.tL_f = [ ... % time since birth (yr), standard length (cm)
1 14.88
2 23.80
3 27.70];
data.tL_f(:,1) = 365 * (0.5 + data.tL_f(:,1)); % convert yr to d
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'standard length', 'female'};  
temp.tL_f    = C2K(24);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'BerrAday2004';
comment.tL_f = 'data for females';
% t-L data males
data.tL_m = [ ... % time since birth (yr), standard length (cm)
1 13.20
2 17.48
3 16.91
4 17.15];
data.tL_m(:,1) = 365 * (0.5 + data.tL_m(:,1)); % convert yr to d
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'standard length', 'male'};  
temp.tL_m    = C2K(24);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'BerrAday2004';
comment.tL_m = 'data for males';

%% set weights for all real data
weights = setweights(data, []);

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
set1 = {'tL_f','tL_m'}; subtitle1 = {'data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'fresh and brackish waters';
metaData.bibkey.F1 = 'Wiki';
F2 = 'Males carry eggs on a supraoccipital hook; uses its lobed swimbladder, linked to ribs and lateral line nerve, as acoustic apparatus';
metaData.bibkey.F2 = 'BerrAday2004';
F3 = 'Temp range 21-31 C';
metaData.bibkey.F3 = 'BerrAday2004';
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3);

%% Links
metaData.links.id_CoL = '3RG9G'; % Cat of Life
metaData.links.id_ITIS = '172247'; % ITIS
metaData.links.id_EoL = '46577040'; % Ency of Life
metaData.links.id_Wiki = 'Kurtus_gulliveri'; % Wikipedia
metaData.links.id_ADW = 'Kurtus_gulliveri'; % ADW
metaData.links.id_Taxo = '46650'; % Taxonomicon
metaData.links.id_WoRMS = '281236'; % WoRMS
metaData.links.id_fishbase = 'Kurtus-gulliveri'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Kurtus_gulliveri}}';
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
bibkey = 'BerrAday2004'; type = 'Article'; bib = [ ... 
'author = {T. M. BERRA and D. D. ADAY}, ' ... 
'year = {2004}, ' ...
'title = {Otolith description and age-and-growth of \emph{Kurtus gulliveri} from {N}orthern {A}ustralia}, ' ...
'journal = {Journal of Fish Biology}, ' ...
'volume = {65}, ' ...
'pages = {354-362}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BerrNeir2003'; type = 'Article'; bib = [ ... 
'author = {T. M. BERRA and F. J. Neira}, ' ... 
'year = {2003}, ' ...
'title = {Early life history of the Nerseryfish, \emph{Kurtus gulliveri} ({P}ercoformes: {K}urtidae), from {N}orthern {A}ustralia}, ' ...
'journal = {Copeia}, ' ...
'volume = {2003}, ' ...
'pages = {384-390}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/4436}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'record'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishing-worldrecords.com/scientificname/Kurtus~gulliveri/show}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
