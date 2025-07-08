function [data, auxData, metaData, txtData, weights] = mydata_Andrias_japonicus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Caudata'; 
metaData.family     = 'Cryptobranchidae';
metaData.species    = 'Andrias_japonicus'; 
metaData.species_en = 'Japanese giant salamander'; 

metaData.ecoCode.climate = {'Cfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFr', '0iFc'};
metaData.ecoCode.embryo  = {'Fnm'};
metaData.ecoCode.migrate = {'TT'};
metaData.ecoCode.food    = {'biCi', 'piCvm'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(10); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'L_t'; 'Wwi'; 'Ww_t'; 'Ri'}; 
metaData.data_1     = {}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2011 09 20];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2017 11 11];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 11 11]; 


%% set data
% zero-variate data

data.ab = 50;      units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'KuwaSuzu1989';   
  temp.ab = C2K(10);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.ap = 15*365;  units.ap = 'd';    label.ap = 'age at puberty';           bibkey.ap = 'amphibiaweb';
  temp.ap = C2K(10);  units.temp.ap = 'K'; label.temp.ap = 'temperature';
data.am = 80*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'amphibiaweb';   
  temp.am = C2K(10);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 3;      units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'KuwaSuzu1989';  
data.L1  = 10;     units.L1  = 'cm';  label.L1  = 'total length at 1 yr';    bibkey.L1  = 'KuwaSuzu1989';  
  temp.L1 = C2K(10);  units.temp.L1 = 'K'; label.temp.L1 = 'temperature';
data.L3  = 20;     units.L3  = 'cm';  label.L3  = 'total length at 3 yr';    bibkey.L3  = 'KuwaSuzu1989';  
  temp.L3 = C2K(10);  units.temp.L3 = 'K'; label.temp.L3 = 'temperature';
data.Lp  = 35;     units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'KuwaSuzu1989'; 
  comment.Lp = 'males 30 cm, females 40 cm';
data.Li  = 150;    units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'KuwaSuzu1989';
  comment.Li = 'snout-to-vent length = 90 cm';

data.Ww136 = 26300; units.Ww136 = 'g';   label.Ww136 = 'wet weight at 136 cm'; bibkey.Ww136 = 'KuwaSuzu1989';
data.Wwi = 36000;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'KuwaSuzu1989';

data.Ri  = 1000/ 365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'KuwaSuzu1989';   
temp.Ri = C2K(10);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

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
metaData.links.id_CoL = 'DTJR'; % Cat of Life
metaData.links.id_ITIS = '202087'; % ITIS
metaData.links.id_EoL = '319982'; % Ency of Life
metaData.links.id_Wiki = 'Andrias_japonicus'; % Wikipedia
metaData.links.id_ADW = 'Andrias_japonicus'; % ADW
metaData.links.id_Taxo = '47247'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_amphweb = 'Andrias+japonicus'; % AmphibiaWeb
metaData.links.id_AnAge = 'Andrias_japonicus'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Andrias_japonicus}}';
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
bibkey = 'KuwaSuzu1989'; type = 'Article'; bib = [ ... 
'author = {Kuwabara, K. and Suzuki, N. and Wakabayashi, F. and Ashikaga, H. and Inoue, T. and Kobara, J.}, ' ... 
'year = {1989}, ' ...
'title = {Breeding the {J}apanese Giant Salamander at Asa Zoological Park}, ' ...
'journal = {International Zoo Yearbook, London,}, ' ...
'volume = {28}, ' ...
'pages = {22--31}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{http://amphibiaweb.org/cgi/amphib_query?where-genus=Andrias&where-species=japonicus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

