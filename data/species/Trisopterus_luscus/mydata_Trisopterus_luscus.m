function [data, auxData, metaData, txtData, weights] = mydata_Trisopterus_luscus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Gadiformes'; 
metaData.family     = 'Gadidae';
metaData.species    = 'Trisopterus_luscus'; 
metaData.species_en = 'Pouting'; 
metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MANE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMc'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};
metaData.T_typical  = C2K(10); % K, body temp
metaData.data_0     = {'ah'; 'ab'; 'am'; 'Lh'; 'Lp'; 'Li'};  % tags for different types of zero-variate data
metaData.data_1     = {'L-N'; 'L-Ww'}; % tags for different types of uni-variate data

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};           
metaData.date_subm = [2012 04 29]; 
metaData.email    = {'bas.kooijman@vu.nl'}; 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2016 10 17];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 10 17]; 

%% set data
% zero-variate data;

data.ah = 108/24;  units.ah = 'd';    label.ah = 'age at hatch';  bibkey.ah = 'AlonVerg2010';  
  temp.ah = C2K(13);  units.temp.ah = 'K'; label.temp.ah = 'temperature';
data.ab = data.ah + 2; units.ab = 'd';    label.ab = 'age at birth';  bibkey.ab = 'AlonVerg2010';   
  temp.ab = C2K(13);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab  = 'guessed from ah'; 
data.am = 11*365;     units.am = 'd';    label.am = 'life span';     bibkey.am = 'Wiki';   
  temp.am = C2K(10);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lh  = 0.313;  units.Lh  = 'cm';   label.Lh  = 'total length at hatch';    bibkey.Lh  = 'AlonVerg2010';  
data.Lp  = 21.6;   units.Lp  = 'cm';   label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase';
  comment.Lp = 'fishbase: 21-25 cm';
data.Li  = 46;     units.Li  = 'cm';   label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';
 
% uni-variate data
%  T = 273 + 13
LWN = [ ... % length (cm), wet weight (g), 
%          # egg/batch, time between spawns (d), egg diameter (mum)
28 403 29211 2.0 1019
24 225  8588 1.8 1041
22 141  9430 2.3 1035
22 137  5182 4.6 1016
26 206  9541 3.5 1051
20 103  4789 2.2 1010];
data.LW = LWN(:,[1 2]); % weight-at-length
units.LW = {'cm', 'g'};   label.LW = {'total length', 'wet weight'};  bibkey.LW = 'MetiIlky2008';
%
data.LN = LWN(:,[1 3]); % # eggs-at-length
units.LN = {'cm', '#'};     label.LN = {'total length', 'eggs/batch'};  bibkey.LN = 'MetiIlky2008';
temp.LN = C2K(13);  units.temp.LN = 'K'; label.temp.LN = 'temperature';

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
D1 = 'An average of one spawn for each 3 d is assumed for all lengths';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = '592TK'; % Cat of Life
metaData.links.id_ITIS = '164755'; % ITIS
metaData.links.id_EoL = '46564436'; % Ency of Life
metaData.links.id_Wiki = 'Trisopterus_luscus'; % Wikipedia
metaData.links.id_ADW = 'Trisopterus_luscus'; % ADW
metaData.links.id_Taxo = '44358'; % Taxonomicon
metaData.links.id_WoRMS = '126445'; % WoRMS
metaData.links.id_fishbase = 'Trisopterus-luscus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib =  ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Trisopterus_luscus}}';
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
bibkey = 'AlonVerg2010'; type = 'Article'; bib = [ ... 
'author = {Alonso-fernandez, A. and Vergara, A. R. and Saborido-Rey, F.}, ' ... 
'year = {2010}, ' ...
'title = {Embryonic development and spawning pattern of \emph{Trisopterus luscus} ({T}eleostei: {G}adidae) under controlled conditions}, ' ...
'journal = {Journal of the Marine Biological Association of the United Kingdom}, ' ...
'doi = {10.1017/S0025315410000147}, ' ...
'pages = {1-7}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MetiIlky2008'; type = 'Article'; bib = [ ... 
'author = {Metin, G. and Ilkyza, A. T. and Kinacucgil, H. T.}, ' ... 
'year = {2008}, ' ...
'title = {Growth, Mortality, and Reproduction of Poor Cod (\emph{Trisopterus minutus} {L}inn., 1758) in the {C}entral {A}egean {S}ea}, ' ...
'journal = {Turk. J. Zool.}, ' ...
'volume = {32}, ' ...
'pages = {43--51}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = [...
'howpublished = {\url{http://www.fishbase.org/summary/Trisopterus-luscus.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

