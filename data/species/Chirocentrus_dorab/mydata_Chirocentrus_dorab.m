  function [data, auxData, metaData, txtData, weights] = mydata_Chirocentrus_dorab

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Clupeiformes'; 
metaData.family     = 'Chirocentridae';
metaData.species    = 'Chirocentrus_dorab'; 
metaData.species_en = 'Dorab wolf herring'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MIE', 'MPW'};
metaData.ecoCode.habitat = {'0iMpe'};
metaData.ecoCode.embryo  = {'Mpe'};
metaData.ecoCode.migrate = {'Ma'};
metaData.ecoCode.food    = {'biPz', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2014 06 12];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.author_mod_1   = {'Bas Kooijman'};        
metaData.date_mod_1     = [2017 11 11];                           
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};                 
metaData.address_mod_1  = {'VU University Amsterdam'}; 

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2     = [2023 04 02];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.author_mod_3   = {'Bas Kooijman'};    
metaData.date_mod_3     = [2023 08 22];              
metaData.email_mod_3    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_3  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 08 22];

%% set data
% zero-variate data
data.ab = 2;      units.ab = 'd';    label.ab = 'age at birth';         bibkey.ab = 'Dels1930'; 
  temp.ab = C2K(27); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'temp EOL: 26-29C; Dels1930: probably 1.5 or 2 d';
data.ap = 305;    units.ap = 'd';    label.ap = 'age at puberty';       bibkey.ap = 'AbduPill2011';
  temp.ap = C2K(25); units.temp.ap = 'K'; label.temp.ap = 'temperature';
  comment.ap = 'read from growth curve for Lp';
data.am = 13*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(25); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb = 0.68;   units.Lb = 'cm';   label.Lb = 'total length at birth';  bibkey.Lb = {'Dels1930','Rich2008'};
data.Lp = 49.2;   units.Lp = 'cm';   label.Lp = 'total length at puberty for female'; bibkey.Lp = 'AbduPill2011'; 
data.Lpm = 48.6;   units.Lpm = 'cm';   label.Lpm = 'total length at puberty for male'; bibkey.Lpm = 'AbduPill2011'; 
data.Li = 100;    units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'ADW';
data.Lim = 100;    units.Lim = 'cm';   label.Lim = 'ultimate total length';  bibkey.Lim = 'ADW';

data.Wwi = 1200;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'ADW';
  
data.Ri = 60268/365;   units.Ri = '#/d';  label.Ri = 'reprod rate at TL 58.7 cm';    bibkey.Ri = 'AbduPill2011'; 
  temp.Ri = C2K(25); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data 
% time-length
data.tL = [ ... % time since birth (mnth), total length (cm)
    1.7 11.5
    3.7 22.2
    5.1 29.4
    6.7 36.2];
data.tL(:,1) = data.tL(:,1) * 30.5; % convert mnth to d
units.tL = {'d', 'cm'};     label.tL = {'time since birth', 'total length'};  
  temp.tL = C2K(25); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'AbduPill2011'; 
 
%% set weights for all real data
weights = setweights(data, []);
weights.tL = 3 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'incubation time is ignored; weight could not be found';
D3 = 'mod_2: males have equal state variables at b, compared to females';
D4 = 'mod_3: tL data replaced, because the previous data of Luth1985 wrongly implies a growth rate that was much too slow';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4);

%% Links
metaData.links.id_CoL = '5XT4V'; % Cat of Life
metaData.links.id_ITIS = '161883'; % ITIS
metaData.links.id_EoL = '46562710'; % Ency of Life
metaData.links.id_Wiki = 'Chirocentrus_dorab'; % Wikipedia
metaData.links.id_ADW = 'Chirocentrus_dorab'; % ADW
metaData.links.id_Taxo = '42695'; % Taxonomicon
metaData.links.id_WoRMS = '212257'; % WoRMS
metaData.links.id_fishbase = 'Chirocentrus-dorab'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Chirocentrus_dorab}}';  
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
bibkey = 'Dels1930'; type = 'Article'; bib = [ ...  
'author = {Delsman, H. C.}, ' ...
'year = {1930}, ' ...
'title = {Fish eggs and larvae from the {J}ava {S}ea On \emph{Chirocentrus hypelosoma} and \emph{dorab}.}, ' ... 
'journal = {Treubia}, ' ...
'volume = 12, '...
'pages = {46--50}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Luth1985'; type = 'Article'; bib = [ ...    
'author = {Luther, G.}, ' ...
'year  = {1985}, ' ...
'title = {AGE AND GROWTH OF THE FISHES OF THE GENUS \emph{Chirocentrus} {C}UVIER}, ' ...  
'journal = {J. Mar. Bio. Ass. India}, ' ...
'volume = {27}, ' ...
'pages = {50--67}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Rich2008'; type = 'Book'; bib = [ ...    
'author = {W. J. Richards}, ' ...
'year  = {2008}, ' ...
'title = {Identification Guide of The early life history stages of fishes from the Waters of {K}uwait in the {A}rabian {G}ulf, {I}ndian {O}cean}, ' ...  
'publisher = {Kuwait Institute for Scientific Research}, ' ...
'ISBN = {978-99906-41-94-3}, ' ...
'address = {P.O.Box 24885, 13109 Safat, Kuwait}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AbduPill2011'; type = 'Article'; bib = [ ...    
'author = {E. M. Abdussamad and N. G. K. Pillai and P. U. Zacharia AND K. Jeyabalan}, ' ...
'year  = {2011}, ' ...
'title = {Dorab fishery of {G}ulf of {M}annar waters and population characteristics of the species \emph{Chirocentrus dorab} (Forsk\r{a}l, 1775) and \emph{Chirocentrus nudus} {S}wainson, 1839}, ' ...  
'journal = {Indian J. Fish.}, ' ...
'volume = {58}, ' ...
'pages = {19--23}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EOL'; type = 'Misc'; bib = ...
'howpublished = {\url{http://eol.org/pages/994538/details}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/1452}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'FAO'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fao.org/fishery/species/2113/en}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Chirocentrus_dorab/}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

