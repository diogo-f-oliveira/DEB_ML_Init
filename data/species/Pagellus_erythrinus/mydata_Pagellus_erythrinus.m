function [data, auxData, metaData, txtData, weights] = mydata_Pagellus_erythrinus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Spariformes'; 
metaData.family     = 'Sparidae';
metaData.species    = 'Pagellus_erythrinus'; 
metaData.species_en = 'Common pandora'; 
metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAE'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'Hsm'};
metaData.ecoCode.reprod  = {'O'};
metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ah'; 'ab'; 'aj'; 'ap'; 'am'; 'Lh'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Dina Lika'};    
metaData.date_subm = [2013 05 25];              
metaData.email    = {'lika@biology.uoc.gr'};            
metaData.address  = {'University of Crete'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2015 09 21];


%% set data
% zero-variate data

data.ah = 2.04;   units.ah = 'd';    label.ah = 'age at hatch';            bibkey.ah = 'LikaKooy2014';   
  temp.ah = C2K(22); units.temp.ah = 'K'; label.temp.ah = 'temperature';
data.ab = 5;      units.ab = 'd';    label.ab = 'age at birth';            bibkey.ab = 'LikaKooy2014';   
  temp.ab = C2K(19); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.aj = 100;    units.aj = 'd';    label.aj = 'age at metam';            bibkey.aj = 'LikaKooy2014';
  temp.aj = C2K(19); units.temp.aj = 'K'; label.temp.aj = 'temperature';
data.ap = 1.13*365;  units.ap = 'd'; label.ap = 'age at puberty';          bibkey.ap = 'fishbase';
  temp.ap = C2K(20); units.temp.ap = 'K'; label.temp.ap = 'temperature';
  comment.ap = 'for females; 1-2 yr';
data.am = 11*365; units.am = 'd';    label.am = 'life span';               bibkey.am = 'fishbase';   
  temp.am = C2K(20); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lh  = 0.255; units.Lh  = 'cm';  label.Lh  = 'total length at hatch';  bibkey.Lh  = 'LikaKooy2014';  
data.Lb  = 0.318; units.Lb  = 'cm';  label.Lb  = 'total length at birth';  bibkey.Lb  = 'LikaKooy2014';  
data.Lp  = 17.4;  units.Lp  = 'cm';  label.Lp  = 'total length at puberty';bibkey.Lp  = 'fishbase'; 
data.Li  = 60;    units.Li  = 'cm';  label.Li  = 'ultimate total length';  bibkey.Li  = 'fishbase';

data.Wwi = 3240;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';

data.GSI  = 0.05; units.GSI  = '-'; label.GSI  = 'gonado-somatic index'; bibkey.GSI = 'Papa2013';   
temp.GSI = C2K(22); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
 
% uni-variate data
% t-L data
data.tL = [1	2	3	5	6	8	10	12	14	17	19	21	23	...
      26	29	31	34	40	47;...
      2.45	2.98	3.16	3.25	3.34	3.99	4.43	...
      5.04	5.81	7.58	9.35	10.15	11.60	13.41	...
      16.77	20.21	20.35	25.00	32.25]'; % mm, total length at f and T
data.tL(:,2) = data.tL(:,2)/ 10; % convert mm to cm
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(22);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'LikaKooy2014';
  
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
metaData.links.id_CoL = '4BZBJ'; % Cat of Life
metaData.links.id_ITIS = '169215'; % ITIS
metaData.links.id_EoL = '46579966'; % Ency of Life
metaData.links.id_Wiki = 'Pagellus_erythrinus'; % Wikipedia
metaData.links.id_ADW = 'Pagellus_erythrinus'; % ADW
metaData.links.id_Taxo = '45317'; % Taxonomicon
metaData.links.id_WoRMS = '127060'; % WoRMS
metaData.links.id_fishbase = 'Pagellus-erythrinus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pagellus_erythrinus}}';
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

