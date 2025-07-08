function [data, auxData, metaData, txtData, weights] = mydata_Bitis_gabonica

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Viperidae';
metaData.species    = 'Bitis_gabonica'; 
metaData.species_en = 'Gaboon viper'; 

metaData.ecoCode.climate = {'A', 'Cw'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCv'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O', 'Apa'};

metaData.T_typical  = C2K(24); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 11 05];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2018 11 05];

%% set data
% zero-variate data

data.ab = 7*30.5;     units.ab = 'd';    label.ab = 'age at puberty for females';     bibkey.ab = 'Wiki';
  temp.ab = C2K(24); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 2*365;     units.tp = 'd';    label.tp = 'time since birth at puberty for females';  bibkey.tp = 'Wiki';
  temp.tp = C2K(24); units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'value is uncertain; might be 5 yrs';
data.am = 18*365;  units.am = 'd';    label.am = 'life span';                    bibkey.am = 'AnAge';   
  temp.am = C2K(24); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 30;    units.Lb  = 'cm';  label.Lb  = 'total length oat birth';  bibkey.Lb  = 'ADW';
data.Li  = 180;    units.Li  = 'cm';  label.Li  = 'ultimate total length of females';  bibkey.Li  = 'Wiki';

data.Wwb = 52;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';             bibkey.Wwb = {'ADW','Wiki'};
  comment.Wwb = 'based om (Lb/Li)^3*Wwi';
data.Wwi = 11300;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight of females';  bibkey.Wwi = 'Wiki';
  
data.Ri  = 30/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';          bibkey.Ri  = 'ADW';   
  temp.Ri = C2K(24);   units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '8 to 43 young per clutch';

% univariate data
% time-weight data 
data.tW = [ ... % time since birth (d), wet weight (g)
16.392	44.253
49.760	76.437
81.958	98.563
112.985	107.615
144.597	129.741
178.551	193.103
210.749	195.115
241.190	280.603
273.973	293.678
306.756	332.902];
units.tW  = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW   = C2K(24);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'BonnShin2001';


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
D1 = 'Males are assumed not to differ from females';
D2 = 'In view of low somatic maintenance, pseudodata k_J = 0.002 1/d is replaced by pseudodata k = 0.3';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts
F1 = 'Ovoviviparous';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'LXL7'; % Cat of Life
metaData.links.id_ITIS = '634953'; % ITIS
metaData.links.id_EoL = '1057054'; % Ency of Life
metaData.links.id_Wiki = 'Bitis_gabonica'; % Wikipedia
metaData.links.id_ADW = 'Bitis_gabonica'; % ADW
metaData.links.id_Taxo = '50312'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Bitis&species=gabonica'; % ReptileDB
metaData.links.id_AnAge = 'Bitis_gabonica'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Bitis_gabonica}}';
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
bibkey = 'BonnShin2001'; type = 'Article'; bib = [ ... 
'author = {X. Bonnet and R. Shine and G. Naulleau and C. Thiburce}, ' ... 
'year = {2001}, ' ...
'title = {Plastic vipers: influence of food intake on the size and shape of {G}aboon vipers (\emph{Bitis gabonica})}, ' ...
'journal = {J. Zool., Lond.}, ' ...
'volume = {255}, ' ...
'pages = {341-351}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Bitis_gabonica}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Bitis_gabonica/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

