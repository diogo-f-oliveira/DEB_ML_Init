function [data, auxData, metaData, txtData, weights] = mydata_Dentex_dentex 

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Spariformes'; 
metaData.family     = 'Sparidae';
metaData.species    = 'Dentex_dentex'; 
metaData.species_en = 'Common dentex'; 
metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAE'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};
metaData.T_typical  = C2K(17.7); % K, body temp
metaData.data_0     = {'ah'; 'ab'; 'aj'; 'ap'; 'am'; 'Lh'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'Wwi'; 'GSI'}; 
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

data.ah = 3.3;    units.ah = 'd';    label.ah = 'age at hatch';            bibkey.ah = 'LikaKooy2014';   
  temp.ah = C2K(17.7); units.temp.ah = 'K'; label.temp.ah = 'temperature';
data.ab = 8;      units.ab = 'd';    label.ab = 'age at birth';            bibkey.ab = 'LikaKooy2014';   
  temp.ab = C2K(17.7); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.aj = 50;    units.aj = 'd';    label.aj = 'age at metam';            bibkey.aj = 'LikaKooy2014';
  temp.aj = C2K(17.7); units.temp.aj = 'K'; label.temp.aj = 'temperature';
  comment.aj = 'feed on plankton+ dry food';
data.ap = 3*365;  units.ap = 'd'; label.ap = 'age at puberty';          bibkey.ap = 'fishbase';
  temp.ap = C2K(20); units.temp.ap = 'K'; label.temp.ap = 'temperature';
  comment.ap = 'for females; 1-2 yr';
data.am = 13*365; units.am = 'd';    label.am = 'life span';               bibkey.am = 'fishbase';   
  temp.am = C2K(17.7); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lh  = 0.249; units.Lh  = 'cm';  label.Lh  = 'total length at hatch';  bibkey.Lh  = 'LikaKooy2014';  
data.Lb  = 0.365; units.Lb  = 'cm';  label.Lb  = 'total length at birth';  bibkey.Lb  = 'LikaKooy2014';  
data.Lj  = 2.4;   units.Lj  = 'cm';  label.Lj  = 'total length at metam';  bibkey.Lj  = 'LikaKooy2014';  
data.Lp  = 37;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty';bibkey.Lp  = 'fishbase'; 
data.Li  = 100;   units.Li  = 'cm';  label.Li  = 'ultimate total length';  bibkey.Li  = 'fishbase';

data.Wwi = 14.3e3;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';

data.GSI  = 0.05; units.GSI  = '-'; label.GSI  = 'gonado-somatic index'; bibkey.GSI = 'Papa2013';   
temp.GSI = C2K(17.7); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
 
% uni-variate data
% t-L data
data.tL = [2	3	4	5	6	7	8	9	10	11	12	13	16	18	20	22	24 ...
    26	28	29	33	35	38	40	42	44	46	48	53	55	56; ...
    3.04	3.06	3.02	3.54	3.57	3.56	3.93	3.82	4.04	...
    4.62	4.54	5.16	5.99	6.78	7.36	8.95	8.81	10.98	...
    11.06	13.88	15.19	17.52	18.84	20.42	22.87	23.03	23.37	23.42	26.10	26.91	28.28]';% mm, physical length at f and T
data.tL(:,2) = data.tL(:,2)/ 10; % convert mm to cm
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(20);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
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
metaData.links.id_CoL = '34TT8'; % Cat of Life
metaData.links.id_ITIS = '169224'; % ITIS
metaData.links.id_EoL = '46579936'; % Ency of Life
metaData.links.id_Wiki = 'Dentex_dentex'; % Wikipedia
metaData.links.id_ADW = 'Dentex_dentex'; % ADW
metaData.links.id_Taxo = '172982'; % Taxonomicon
metaData.links.id_WoRMS = '273962'; % WoRMS
metaData.links.id_fishbase = 'Dentex-dentex'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Dentex_dentex}}';
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
'title = {Metabolic acceleration in {M}editerranean {P}erciformes.}, ' ...
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

