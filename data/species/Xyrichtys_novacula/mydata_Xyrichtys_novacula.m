function [data, auxData, metaData, txtData, weights] = mydata_Xyrichtys_novacula
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Labriformes'; 
metaData.family     = 'Labridae';
metaData.species    = 'Xyrichtys_novacula'; 
metaData.species_en = 'Pearly razorfish'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MA','MAm'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mnm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'Hsf'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24.4); % K, body temp
metaData.data_0     = {'am';  'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 05 24];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 05 24];

%% set data
% zero-variate data

data.am = 8*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'fishbase';   
  temp.am = C2K(24.4);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 15;     units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'guess'; 
  comment.Lp = 'based on Labrus_mixta: 16*38/40';
data.Li  = 38;    units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 1.95e-4;    units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.72 mm of Labrus_bergylta: pi/6*0.072^3';
data.Wwp = 46;    units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00955*Lp^3.00, see F1';
data.Wwi = 788;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00955*Li^3.00, see F1';

data.GSI  = 0.03;   units.GSI  = '-'; label.GSI  = 'gonado somatic index';   bibkey.GSI  = 'CardArdi1998';   
  temp.GSI = C2K(24.4);  units.temp.GSI = 'K'; label.temp.GSI = 'temperature';

% univariate data
% time-length
data.tL = [ ... % time since birth (yr), total length (cm) 
1	10.466
2	13.933
3	16.721
4	18.997
5	20.199];
data.tL(:,1) = 365 * (.75 + data.tL(:,1)); % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(24.4);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Quig1966'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 3 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are supposed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length weight: Ww in g = 0.00955*(TL in cm)^3.00';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Protogynous hermaphrodite: females may change to males; all are born as female';
metaData.bibkey.F2 = 'Wiki'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '7FZVL'; % Cat of Life
metaData.links.id_ITIS = '614513'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Xyrichtys_novacula'; % Wikipedia
metaData.links.id_ADW = 'Xyrichtys_novacula'; % ADW
metaData.links.id_Taxo = '190165'; % Taxonomicon
metaData.links.id_WoRMS = '126971'; % WoRMS
metaData.links.id_fishbase = 'Xyrichtys-novacula'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Xyrichtys_novacula}}';
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
bibkey = 'Quig1966'; type = 'Article'; bib = [ ... 
'author = {Quignard, J.-P.}, ' ... 
'year = {1966}, ' ...
'title = {Recherches sur les {L}abridae ({P}oissons {T}\''{e}l\''{e}ost\''{e}ens) perciformes des c\^{o}tes europ\''{e}ennes}, ' ...
'journal = {Syst\''{e}matique et biologie. Naturalia Monspeliensia S\''{e}r. Zoologique}, ' ...
'volume = {5}, ' ...
'pages = {1-247}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'CardArdi1998'; type = 'Article'; bib = [ ... 
'author = {M. Cardinale and F. Colloca and G.D. Ardizzone}, ' ... 
'year = {1998}, ' ...
'title = {Growth and reproduction of \emph{Xyrichthys novacula} ({P}isces: {L}abridae) in the {M}editerranean {S}ea}, ' ...
'journal = {Sci. Mar.}, ' ...
'volume = {62(3)}, ' ...
'pages = {193-201}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Xyrichtys-novacula.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

