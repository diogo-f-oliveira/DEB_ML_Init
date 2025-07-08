function [data, auxData, metaData, txtData, weights] = mydata_Clarias_agboyiensis

%% set metaData

metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Siluriformes'; 
metaData.family     = 'Clariidae';
metaData.species    = 'Clarias_agboyiensis'; 
metaData.species_en = 'Catfish'; 

metaData.ecoCode.climate = {'Am'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fs'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(29.5); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 10 01];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 10 01];

%% set data
% zero-variate data;

data.ab = 1.5;      units.ab = 'd';    label.ab = 'age at birth';  bibkey.ab = 'guess';
  temp.ab = C2K(29.5);  units.temp.ab = 'K'; label.temp.ab = 'temperature';  
data.am = 15*365;     units.am = 'd';    label.am = 'life span';     bibkey.am = 'guess';
  temp.am = C2K(29.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 11.2;   units.Lp  = 'cm';	label.Lp  = 'total length at puberty';    bibkey.Lp  = 'EzenInya1998'; 
data.Li  = 29;   units.Li  = 'cm';	label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase'; 
  
data.Wwb = 1.2e-3; units.Wwb = 'g';	label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess'; 
  comment.Wwb = 'based on egg diameter of 1.3 mm of Clarias_gariepinus: pi/6*0.13^3';
data.Wwp = 10.2;   units.Wwp = 'g';	label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase'; 
  comment.Wwp = 'based on 0.00759*Lp^2.98, see F1';
data.Wwi = 173; units.Wwi = 'g';	label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00759*Li^2.98, see F1';

data.Ri = 35720/365; units.Ri = '#/d';  label.Ri = 'max reprod rate';          bibkey.Ri = 'EzenInya1998';
  temp.Ri = C2K(29.5); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
  0.5 15.0
  1.0 23.0
  1.5 29.0];
data.tL(:,1) = 365 * data.tL(:,1); % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time', 'total length'};  
temp.tL    = C2K(29.5);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'EzenInya1998';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to not differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00759*(TL in cm)^2.98';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'VR8S'; % Cat of Life
metaData.links.id_ITIS = '681154'; % ITIS
metaData.links.id_EoL = '207114'; % Ency of Life
metaData.links.id_Wiki = 'Clarias'; % Wikipedia
metaData.links.id_ADW = 'Clarias_agboyiensis'; % ADW
metaData.links.id_Taxo = '171376'; % Taxonomicon
metaData.links.id_WoRMS = '1012443'; % WoRMS
metaData.links.id_fishbase = 'Clarias-agboyiensis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Clarias}}';
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
bibkey = 'EzenInya1998'; type = 'Article'; bib = [ ... 
'author = {Ezenwaji, H.M.G. and N.M. Inyang}, ' ...
'year = {1998}, ' ...
'title = {Observations on the biology of \emph{Clarias agboyiensis} {S}yndenham, 1980 ({O}steichthyes: {C}lariidae) in the {A}nambra floodriver system, {N}igeria}, ' ...
'journal = {Fish. Res.}, ' ...
'volume = {36(1)}, ' ...
'pages = {47-60}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Clarias-agboyiensis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
