function [data, auxData, metaData, txtData, weights] = mydata_Microgadus_tomcod
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Gadiformes'; 
metaData.family     = 'Gadidae';
metaData.species    = 'Microgadus_tomcod'; 
metaData.species_en = 'Atlantic tomcod '; 

metaData.ecoCode.climate = {'MC','Dfb'};
metaData.ecoCode.ecozone = {'MANE','THn'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcp','0iFe','0iFl'};
metaData.ecoCode.embryo  = {'Mp','Fp'};
metaData.ecoCode.migrate = {'Mda'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(16); % in K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'};  
metaData.data_1     = {'t-L'; 't-Ww'; 'L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'}; 
metaData.date_subm = [2020 10 09]; 
metaData.email    = {'bas.kooijman@vu.nl'}; 
metaData.address  = {'VU University, Amsterdam'};

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 10 09]; 

%% set data
% zero-variate data
data.am = 4*365;     units.am = 'd';    label.am = 'life span';               bibkey.am = 'CouiCaba2011';  
  temp.am = C2K(16); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 16;   units.Lp = 'cm';   label.Lp = 'total length at puberty';      bibkey.Lp = 'SchaSher1960';
data.Li = 38.1;    units.Li = 'cm';   label.Li = 'ultimate total length';     bibkey.Li = 'fishbase';

data.Wwb = 1.8e-3; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'SchaSher1960';
  comment.Wwb = 'based on egg diameter of 1.5  mm: pi/6*0.15^3';

% uni-variate data
% time - length
data.tL = [ ... time since birth (yr), total length (cm)
    0  8.586
    1 14.957
    2 16.684
    3 17.912];
data.tL(:,1) = 365 * (0.8 + data.tL(:,1)); % convert yr to d
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(16);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'CouiCaba2011';

% time - weight
data.tWw = [ ... time since birth (d), wet weight (g)
    0  5.34
    1 30.51
    2 43.37
    3 52.37];
data.tWw(:,1) = 365 * (0.8 + data.tWw(:,1)); % convert yr to d
units.tWw = {'d', 'g'}; label.tWw = {'time since birth', 'wet weight'};  
temp.tWw = C2K(16);  units.temp.tWw = 'K'; label.temp.tWw = 'temperature';
bibkey.tWw = 'CouiCaba2011';

% length - fecundity
data.LN = [ ... % total length (cm), fecundity (#)
  20.5  11570
  34.0  17010
  18.0  17050
  17.0   5674
  20.2  14018
  21.5  19186
  25.5  19627
  20.5  13939
  22.0  21634
  19.0  18034
  20.8   5075
  21.0  24752
  22.1  29707
  22.5  19470
  22.0  31640];
units.LN = {'cm', '#'}; label.LN = {'total length', 'fecundity'};  
temp.LN = C2K(16);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'SchaSher1960';

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

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = '42WJ3'; % Cat of Life
metaData.links.id_ITIS = '164720'; % ITIS
metaData.links.id_EoL = '46564440'; % Ency of Life
metaData.links.id_Wiki = 'Microgadus_tomcod'; % Wikipedia
metaData.links.id_ADW = 'Microgadus_tomcod'; % ADW
metaData.links.id_Taxo = '44335'; % Taxonomicon
metaData.links.id_WoRMS = '158928'; % WoRMS
metaData.links.id_fishbase = 'Microgadus-tomcod'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Microgadus_tomcod}}';
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
bibkey = 'CouiCaba2011'; type = 'article'; bib = [ ...
'doi = {10.1007/s12237-011-9428-0}, ' ...
'author = {Marc Antoine Couillard and Gilbert Cabana and Jean Fran\c{c}ois Dery and Ga\''{e}tan Daigle and Julian John Dodson}, ' ... 
'year   = {2011}, ' ...
'title  = {Ontogenetic Habitat Shifts of the {A}tlantic Tomcod (\emph{Microgadus tomcod}) Across an Estuarine Transition Zone}, ' ...
'journal = {Estuaries and Coasts}, ' ...
'page = {1234-1245}, ' ...
'volume = {34}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SchaSher1960'; type = 'article'; bib = [ ...
'author = {Everett Schaner and Kenneth Sherman}, ' ... 
'year   = {1960}, ' ...
'title  = {Observations on the Fecundity of the Tomcod, \emph{Microgadus tomcod} ({W}albaum)}, ' ...
'journal = {Copeia}, ' ...
'page = {347-348}, ' ...
'volume = {1960(4)}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Microgadus-tomcod}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
