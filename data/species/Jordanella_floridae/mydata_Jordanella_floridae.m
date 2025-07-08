function [data, auxData, metaData, txtData, weights] = mydata_Jordanella_floridae
%% set metaData

metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cyprinodontiformes'; 
metaData.family     = 'Cyprinodontidae';
metaData.species    = 'Jordanella_floridae'; 
metaData.species_en = 'Flagfish'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFp'};
metaData.ecoCode.embryo  = {'Fnm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biHl'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 't-Ww'; 'T-ab'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};    
metaData.date_subm = [2020 07 27];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 07 27]; 

%% set data
% zero-variate data;

data.am = 200;     units.am = 'd';    label.am = 'life span';     bibkey.am = 'Beyg2009';
  temp.am = C2K(25);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 3.5;  units.Lp  = 'cm';	label.Lp  = 'standard length at puberty';  bibkey.Lp  = 'Beyg2009';
  comment.Lp = 'based on observation that SL 4.1 cm had 55 eggs';
data.Li  = 6;   units.Li  = 'cm';	label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase'; 

data.Wwb = 1.3e-3; units.Wwb = 'g';	label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'FostCair1969'; 
  comment.Wwb = 'based on egg diameter of 1.35 mm: pi/6*0.135^3';
data.Wwp  = 1;   units.Wwp  = 'g';	label.Wwp  = 'wet weight at puberty';    bibkey.Wwp  = 'Beyg2009'; 
data.Wwi  = 4.95;   units.Wwi  = 'g';	label.Wwi  = 'ultimate wet weight';    bibkey.Wwi  = 'fishbase'; 
  comment.Wwi = 'based on 0.01660*Li^3.18, see F1';

data.Ri  = 27; units.Ri  = '#/d'; label.Ri  = 'max reproduction rate'; bibkey.Ri  = 'FostCair1969';   
  temp.Ri = C2K(25); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time-length 
data.tL = [ ... % time since hatch (d), total length (cm)
  7.5 0.472
  7.5 0.475
 30   1.01
 30   0.944
 30   0.918
 30   1.02
 56.5 0.848
 56.5 0.846
135.5 3.96
135.5 3.58
175.5 4.50
175.5 4.45];
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(24);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Beyg2009';

% time-weight 
data.tWw = [ ... % time since hatch (d), wet weight (g)
 30   0.017
 30   0.013
 30   0.010
 30   0.019
135.5 1.18
135.5 0.88
175.5 1.83
175.5 1.88
];
units.tWw   = {'d', 'cm'};  label.tWw = {'time since birth', 'wet weight'};  
temp.tWw    = C2K(24);  units.temp.tWw = 'K'; label.temp.tWw = 'temperature';
bibkey.tWw = 'Beyg2009';

% temp - age at birth
data.Tab = [ ... % temperature (C), age at birth (d)
23 7
27 5.6
31 4.678
35 3.97];
units.Tab   = {'C', 'd'};  label.Tab = {'temperature', 'age at birth'};  
bibkey.Tab = {'Beyg2009','MaryGord2004'};

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 3 * weights.tL;
weights.Wwb = 5 * weights.Wwb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'length-weight: W in g = 0.01660*(TL in cm)^3.18';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1); 

%% Links
metaData.links.id_CoL = '3QQRV'; % Cat of Life
metaData.links.id_ITIS = '165694'; % ITIS
metaData.links.id_EoL = '46566769'; % Ency of Life
metaData.links.id_Wiki = 'Jordanella_floridae'; % Wikipedia
metaData.links.id_ADW = 'Jordanella_floridae'; % ADW
metaData.links.id_Taxo = '44521'; % Taxonomicon
metaData.links.id_WoRMS = '281204'; % WoRMS
metaData.links.id_fishbase = 'Jordanella-floridae'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Jordanella_floridae}}';
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
bibkey = 'Beyg2009'; type = 'phdthesis'; bib = [ ... 
'author = {Lindsay Alexandra Beyger},'...
'title = {Growth, Survivability, and Reproductive Effects of Pulse-Dosed Endosulfan on \emph{Jordanella floridae} ({F}lorida flagfish) Over One Complete Life-cycle},'...
'school = {Univ. Otario, Institute of Technology},'...
'year = {2009}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MaryGord2004'; type = 'Article'; bib = [ ... 
'doi = {10.1111/j.1095-8649.2004.00481}, ' ...
'author = {C. M. St Mary and E. Gordon and R. E. Hale},'...
'title = {Environmental effects on egg development and hatching success in \emph{Jordanella floridae}, a species with parental care},'...
'journal = {Journal of Fish Biology},'...
'volume = {65},'...
'year = {2004},'...
'pages = {760-768}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'FostCair1969'; type = 'Article'; bib = [ ... 
'doi = {10.1111/j.1095-8649.2004.00481}, ' ...
'author = {Neal R. Foster and John Cairns and Roger L. Kaesler},'...
'title = {The Flagfish, \emph{Jordanella floridae}, as a Laboratory Animal for Behavioral Bioassay Studies},'...
'journal = {Proceedings of the Academy of Natural Sciences of Philadelphia},'...
'volume = {121},'...
'year = {1969},'...
'pages = {129-152}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Jordanella-floridae.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

