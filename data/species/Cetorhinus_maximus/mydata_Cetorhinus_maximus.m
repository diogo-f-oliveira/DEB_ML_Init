function [data, auxData, metaData, txtData, weights] = mydata_Cetorhinus_maximus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Lamniformes'; 
metaData.family     = 'Cetorhinidae';
metaData.species    = 'Cetorhinus_maximus'; 
metaData.species_en = 'Basking shark'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0iMcp'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biP'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(11.5); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm     = [2020 10 15];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 10 15];


%% set data
% zero-variate data

data.ab = 3.5*365;    units.ab = 'd';    label.ab = 'age at birth';                    bibkey.ab = 'fao';   
  temp.ab = C2K(11.5); units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.tp = 20*365;    units.tp = 'd';    label.tp = 'time since birth at puberty';      bibkey.tp = 'fishbase';   
  temp.tp = C2K(11.5); units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
data.am = 50*365;    units.am = 'd';    label.am = 'life span';                        bibkey.am = 'Wiki';   
  temp.am = C2K(11.5); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 165;  units.Lb  = 'cm';  label.Lb  = 'total length at birth';               bibkey.Lb  = 'fao';  
data.Lp  = 810;  units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females'; bibkey.Lp  = 'fishbase'; 
data.Lpm = 450;  units.Lpm = 'cm'; label.Lpm  = 'total length at puberty for males';   bibkey.Lpm  = 'fao'; 
data.Li  = 980;  units.Li  = 'cm';  label.Li  = 'ultimate total length for females';   bibkey.Li  = 'fishbase';
data.Lim = 1520; units.Lim = 'cm'; label.Lim  = 'ultimate total length for males';     bibkey.Lim  = 'fishbase';

data.Wwp = 2.625e6; units.Wwp = 'g';  label.Wwp = 'wet weight at puberty for females';  bibkey.Wwp = {'fao','fishbase'};
  comment.Wwp = 'based on  0.00245*Lp^3.20, see F2, see F2';
data.Wwpm = 0.45e6;  units.Wwpm = 'g';   label.Wwpm = 'wet weight at puberty for males';  bibkey.Wwpm = {'fao','fishbase'};
  comment.Wwpm = 'based on  0.00245*Lpm^3.20, see F2, see F2';
data.Wwi = 4.65e6;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';                bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 4.94e-3*Li^3, see F1';
data.Wwim = 17.3e6;  units.Wwim = 'g';   label.Wwim = 'ultimate wet weight';             bibkey.Wwim = 'fishbase';
  comment.Wwim = 'based on 4.94e-3*Lim^3, see F1';

data.Ri  = 6/365/4;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';             bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(11.5); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'upto 6 pups per litter, 1 litter per 4 yrs; ova are numerous and small, oophagy occurs';
  
%% set weights for all real data
weights = setweights(data, []);
weights.Lb = 3 * weights.Lb;
weights.ab = 3 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 3 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;


%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'Almost all data are rather uncertain';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'length - weight: Ww in g = 4.94e-3*(TL in cm)^3';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Ovoviviparous and oophagous; only right ovary is in function';
metaData.bibkey.F2 = 'Wiki'; 
F3 = 'Aging by counting rings in vertebrae is unreliable';
metaData.bibkey.F3 = {'NataWint2008','fao'}; 
metaData.facts = struct('F1',F1, 'F2',F2, 'F3',F3);

%% Links
metaData.links.id_CoL = 'T72Q'; % Cat of Life
metaData.links.id_ITIS = '159907'; % ITIS
metaData.links.id_EoL = '46559748'; % Ency of Life
metaData.links.id_Wiki = 'Cetorhinus_maximus'; % Wikipedia
metaData.links.id_ADW = 'Cetorhinus_maximus'; % ADW
metaData.links.id_Taxo = '41898'; % Taxonomicon
metaData.links.id_WoRMS = '105837'; % WoRMS
metaData.links.id_fishbase = 'Cetorhinus-maximus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Cetorhinus_maximus}}';
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
bibkey = 'NataWint2008'; type = 'Article'; bib = [ ... 
'doi = {10.3354/meps07399}, ' ...
'author = {Lisa J. Natanson and Sabine P. Wintner and Friederike Johansson and Andrew Piercy and Patrick Campbell and Alessandro De Maddalena and Simon J. B. Gulak and Brett Human and Franco Cigala Fulgosi and David A. Ebert and Farid Hemida and Frederik H. Mollen and Stefano Vanni and George H. Burgess and Leonard J. V. Compagno and Andrew Wedderburn-Maxwell}, ' ... 
'year = {2008}, ' ...
'title = {Ontogenetic vertebral growth patterns in the basking shark \emph{Cetorhinus maximus}}, ' ...
'journal = {Mar Ecol Prog Ser}, ' ...
'volume = {361}, ' ...
'pages = {267-278}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Cetorhinus-maximus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Cetorhinus_maximus/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fao'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fao.org/fishery/species/2005/en}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

