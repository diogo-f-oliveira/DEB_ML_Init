function [data, auxData, metaData, txtData, weights] = mydata_Diplodus_puntazzo

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Spariformes'; 
metaData.family     = 'Sparidae';
metaData.species    = 'Diplodus_puntazzo'; 
metaData.species_en = 'sharpsnout sea bream'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAE'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biCi', 'jiHa'};
metaData.ecoCode.gender  = {'Hsm'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ah'; 'ab'; 'aj'; 'ap'; 'am'; 'Lh'; 'Lb'; 'Lj'; 'Li'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Dina Lika'};    
metaData.date_subm = [2013 05 25];              
metaData.email    = {'lika@biology.uoc.gr'};            
metaData.address  = {'University of Crete'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2015 09 09]; 



%% set data
% zero-variate data

data.ah = 1.1;    units.ah = 'd';    label.ah = 'age at hatch';            bibkey.ah = 'PapaKent2004';   
  temp.ah = C2K(24); units.temp.ah = 'K'; label.temp.ah = 'temperature';
data.ab = 4;      units.ab = 'd';    label.ab = 'age at birth';            bibkey.ab = 'PapaKent2004';   
  temp.ab = C2K(20); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.aj = 90;     units.aj = 'd';    label.aj = 'age at metam';            bibkey.aj = 'LikaKooy2014';
  temp.aj = C2K(21); units.temp.aj = 'K'; label.temp.aj = 'temperature';
data.ap = 2*365;  units.ap = 'd';    label.ap = 'age at puberty';          bibkey.ap = 'fishbase';
  temp.ap = C2K(20); units.temp.ap = 'K'; label.temp.ap = 'temperature';
  comment.ap = 'for females; 1-2 yr';
data.am = 10*365; units.am = 'd';    label.am = 'life span';               bibkey.am = 'fishbase';   
  temp.am = C2K(20); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lh  = 0.28;  units.Lh  = 'cm';  label.Lh  = 'total length at hatch';  bibkey.Lh  = 'PapaKent2004';  
data.Lb  = 0.31;  units.Lb  = 'cm';  label.Lb  = 'total length at birth';  bibkey.Lb  = 'PapaKent2004';  
data.Lj  = 3;     units.Lj  = 'cm';  label.Lj  = 'total length at metam';  bibkey.Lj  = 'LikaKooy2014';  
data.Li  = 60;    units.Li  = 'cm';  label.Li  = 'ultimate total length';  bibkey.Li  = 'fishbase';

data.Wwi = 2500;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';

data.GSI  = 0.05; units.GSI  = '-'; label.GSI  = 'gonado-somatic index'; bibkey.GSI = 'Papa2013';   
temp.GSI = C2K(24); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
 
% uni-variate data
% t-L data
data.tL = [1	3	5	6	7	9	10	11	12	13	14	15	16	...
      17	18	19	20	21	22	23	24	26	27	29	31	32	35	...
      36	38	40	41	43	44	45	47	48	50;...
   3.09	3.29	3.73	3.95	3.97	4.71	5.00	5.25	...
   5.40	5.70	5.77	6.26	6.17	6.85	7.16	7.70	...
   8.15	8.27	9.24	8.87	9.93	10.65	11.44	11.32	...
   13.48	13.11	13.40	14.46	14.17	16.65	14.65	18.55...
   16.20	15.40	19.16	15.84	19.20]';% mm, physical length at f and T
data.tL(:,2) = data.tL(:,2)/ 10; % convert mm to cm
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(22);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'PapaKent2004';
  
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

%% Links
metaData.links.id_CoL = '36LF2'; % Cat of Life
metaData.links.id_ITIS = '647899'; % ITIS
metaData.links.id_EoL = '46579946'; % Ency of Life
metaData.links.id_Wiki = 'Diplodus_puntazzo'; % Wikipedia
metaData.links.id_ADW = 'Diplodus_puntazzo'; % ADW
metaData.links.id_Taxo = '173233'; % Taxonomicon
metaData.links.id_WoRMS = '127052'; % WoRMS
metaData.links.id_fishbase = 'Diplodus-puntazzo'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Diplodus}}';
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
bibkey = 'PapaKent2004'; type = 'Article'; bib = [ ... 
'author = {N. Papandroulakis and M. Kentouri and E. Maingot and P. Divanach}, ' ... 
'year = {2005}, ' ...
'title = {Mesocosm: a reliable technology for larval rearing of \emph{Diplodus puntazzo} and \emph{Diplodus sargus sargus}}, ' ...
'journal = {Aquaculture International}, ' ...
'volume = {12}, ' ...
'pages = {345--355}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'LikaKooy2014'; type = 'Article'; bib = [ ... 
'author = {Lika, K. and Kooijman, S. A. L. M. and Papandroulakis, N.}, ' ... 
'year = {2014}, ' ...
'title = {Metabolic acceleration in {M}editerranean {P}erciformes}, ' ...
'journal = {J. Sea Res.}, ' ...
'volume = {94}, ' ...
'pages = {37--46}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Papa2013'; type = 'Misc'; bib = ...
'note = {Papandroulakis pers comm.}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

