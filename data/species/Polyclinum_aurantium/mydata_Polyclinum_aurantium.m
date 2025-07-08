function [data, auxData, metaData, txtData, weights] = mydata_Polyclinum_aurantium

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Ascidiacea'; 
metaData.order      = 'Aplousobranchia'; 
metaData.family     = 'Polyclinidae';
metaData.species    = 'Polyclinum_aurantium'; 
metaData.species_en = 'Ascidian'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MANE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biP'};
metaData.ecoCode.gender  = {'Hh'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15); % K
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Vb'; 'Vi'; 'Ri'};  
metaData.data_1     = {'t-V'}; 

metaData.COMPLETE = 2.1; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2018 11 03];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};      

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2018 11 03]; 


%% set data
% zero-variate data;
data.ab = 1;     units.ab = 'd';    label.ab = 'age at birth';            bibkey.ab = 'guess';    
  temp.ab = C2K(20); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'temperature (18-22 C); ab is actually less than a day for Ciona intestinalis';
data.ap = 40;     units.ap = 'd';    label.ap = 'age at puberty';         bibkey.ap = 'Akau1981';
  temp.ap = C2K(15); units.temp.ap = 'K'; label.temp.ap = 'temperature';
data.am = 2*365; units.am = 'd';    label.am = 'life span';               bibkey.am = 'guess';   
  temp.am = C2K(15); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Vb  = 1.6e-5;   units.Vb  = 'cm^3';  label.Vb  = 'total length at birth'; bibkey.Vb  = 'Akau1981';
  comment.Vb = 'larval volume at attachment';
data.Vi  = 8e-3;  units.Vi  = 'cm^3';  label.Vi  = 'ultimate total length';   bibkey.Vi  = 'Akau1981';
  comment.Vi = 'single zooid';

data.Ri  = 1500/365; units.Ri  = '#/d';label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'guess';   
temp.Ri = C2K(15); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'guess based on kap = 0.9';

% uni-variate data at f
% time-volume
data.tV = [ ... % time since attachment (d), volume (mm^3)
 0	0.016 % L = 0.500; W = 0.025 (see F4)
 4	0.161 % L = 0.969; W = 0.563
10	0.313 % L = 1.156; W = 0.719
15	0.466 % L = 1.250; W = 0.844
22	0.698 % L = 1.625; W = 0.906
31	4.926 % L = 3.020; W = 1.765
40  6.964 % L = 3.125; W = 2.063 
];
data.tV(:,2) = data.tV(:,2)/1e3; % convert mm^3 to cm^3
units.tV = {'d', 'cm^3'}; label.tV = {'time since attachment', 'volume'};  
temp.tV = C2K(15); units.temp.tV = 'K'; label.temp.tV = 'temperature';
bibkey.tV = 'Akau1981'; 
comment.tV = 'volume of zooid with length L and width W computed as pi/6*L*W^2, where L and W measured from drawings; volume at attachment for F4';

%% set weights for all real data
weights = setweights(data, []);
weights.tV = 5 * weights.tV;
weights.Vi = 50 * weights.Vi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack data and txt_data for output
auxData.temp   = temp;
txtData.units  = units;
txtData.label  = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = '';     
metaData.discussion = struct('D1',D1); 

%% Facts
F1 = 'Asexual reproduction by 3 types of buds: 1 thoracic bud, 1 abdominal bud and 5 to 8 postabdominal ones';
metaData.bibkey.F1 = 'Sato1994';
F2 = 'Larval stage does not feed, lasts minutes to hours at 20 C.';
metaData.bibkey.F2 = 'Sato1994';
F3 = 'Hermaphroditic; external fertilisation';
metaData.bibkey.F3 = 'Sato1994';
F4 = 'Length larval trunc is 0.5 mm, width 0.25 mm, so volume is pi/6*0.5*0.25^2 = 1.6e-2 mm^3';
metaData.bibkey.F4 = {'Mill1970','Carl1952'};
metaData.facts = struct('F1',F1, 'F2', F2, 'F3', F3, 'F4', F4);

%% Links
metaData.links.id_CoL = '4L4HT'; % Cat of Life
metaData.links.id_ITIS = '159018'; % ITIS
metaData.links.id_EoL = '46583549'; % Ency of Life
metaData.links.id_Wiki = 'Polyclinum_aurantium'; % Wikipedia
metaData.links.id_ADW = 'Polyclinum_aurantium'; % ADW
metaData.links.id_Taxo = '538990'; % Taxonomicon
metaData.links.id_WoRMS = '103674'; % WoRMS


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Polyclinum_aurantium}}'; 
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
bibkey = 'Akau1981'; type = 'article'; bib = [ ...
'author = {M. Akauchi}, ' ...
'year = {1981}, ' ...
'title  = {Development and budding in the oozooids of \emph{Polyclinum aurantium} (a colonial ascidian) ({P}rotochordata)}, ' ...
'journal = {J. Zool., Lond.}, ' ...
'volume = {194}, '...
'pages = {l--9}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Carl1952'; type = 'article'; bib = [ ...
'author = {D. B. Carlis}, ' ...
'year = {1952}, ' ...
'title  = {ON AMPULLARY TISSUE IN THE LARVA OF \emph{Polyclinum aurantium} {M}ILNE {E}DWARDS}, ' ...
'journal = {J. Mar. Biol. Ass. UK}, ' ...
'volume = {31}, '...
'pages = {63--64}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Sato1994'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {N. Satoh}, ' ...
'year = {1994}, ' ...
'title  = {Developmental biology of the Ascidians}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Mill1970'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {R. H. Millar}, ' ...
'year = {1970}, ' ...
'title  = {British Ascidians}, ' ...
'series = {Synopses of the British Fauna}, ' ...
'volume = {1}, ' ...
'publisher = {Academic Press, London}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

