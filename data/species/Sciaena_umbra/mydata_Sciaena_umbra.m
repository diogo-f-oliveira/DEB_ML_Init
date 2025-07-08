function [data, auxData, metaData, txtData, weights] = mydata_Sciaena_umbra

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Sciaeniformes'; 
metaData.family     = 'Sciaenidae';
metaData.species    = 'Sciaena_umbra'; 
metaData.species_en = 'brown meagre'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ah'; 'ab'; 'aj'; 'ap'; 'am'; 'Lh'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Dina Lika'};    
metaData.date_subm = [2013 05 25];              
metaData.email    = {'lika@biology.uoc.gr'};            
metaData.address  = {'University of Crete'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2016 10 27];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2     = [2017 11 13];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 11 13];

%% set data
% zero-variate data

data.ah = 1.5;      units.ah = 'd';  label.ah = 'age at hatch';            bibkey.ah = 'LikaKooy2014';   
  temp.ah = C2K(23); units.temp.ah = 'K'; label.temp.ah = 'temperature';
data.ab = 3.5;      units.ab = 'd';  label.ab = 'age at birth';            bibkey.ab = 'LikaKooy2014';   
  temp.ab = C2K(23); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.aj = 35;     units.aj = 'd';    label.aj = 'age at metam';            bibkey.aj = 'fishbase';
  temp.aj = C2K(20); units.temp.aj = 'K'; label.temp.aj = 'temperature';
data.ap = 3*365;  units.ap = 'd';    label.ap = 'age at puberty';          bibkey.ap = 'fishbase';
  temp.ap = C2K(20); units.temp.ap = 'K'; label.temp.ap = 'temperature';
data.am = 21*365; units.am = 'd';    label.am = 'life span';               bibkey.am = 'fishbase';   
  temp.am = C2K(20); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lh  = 0.29;  units.Lh  = 'cm';  label.Lh  = 'total length at hatch';  bibkey.Lh  = 'LikaKooy2014';  
data.Lb  = 0.32;  units.Lb  = 'cm';  label.Lb  = 'total length at birth';  bibkey.Lb  = 'LikaKooy2014';  
data.Lp  = 25;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty';bibkey.Lp  = 'fishbase'; 
data.Li  = 70;    units.Li  = 'cm';  label.Li  = 'ultimate total length';  bibkey.Li  = 'fishbase';

data.Wwi = 6500;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';

data.GSI  = 0.05; units.GSI  = '-'; label.GSI  = 'gonado-somatic index'; bibkey.GSI  = 'Papa2013';   
  temp.GSI = C2K(20.5); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  comment.GSI = 'temperature for GSI the temp gradually increases from 14 to 22';
 
% uni-variate data
% time-length
data.tL = [1	2	3	4	5	6	7	8	9	10	12	14	15	16	17	18 ...
19	21	22	23	24	25	26	27	28	29	30	32	34	35	36	37	39;...
2.88	3.21	3.37	3.65	3.80	4.76	4.97	5.26	5.04...
5.45	6.45	8.38	8.39	9.02	9.05	9.92	9.10	11.23...
11.60	14.66	13.25	15.61	16.03	16.99	17.33	17.50	20.44...
20.99	17.52	22.58	22.00	22.75	31.46]';% mm, total length at f and T
data.tL(:,2) = data.tL(:,2)/10; % convert mm to cm
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(24.5);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'LikaKooy2014';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'In view of low somatic maintenance, pseudodata k_J = 0.002 1/d is replaced by pseudodata k = 0.3';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = '4VH83'; % Cat of Life
metaData.links.id_ITIS = '169330'; % ITIS
metaData.links.id_EoL = '46578936'; % Ency of Life
metaData.links.id_Wiki = 'Sciaena_umbra'; % Wikipedia
metaData.links.id_ADW = 'Sciaena_umbra'; % ADW
metaData.links.id_Taxo = '187003'; % Taxonomicon
metaData.links.id_WoRMS = '127010'; % WoRMS
metaData.links.id_fishbase = 'Sciaena-umbra'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sciaena_umbra}}';
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

