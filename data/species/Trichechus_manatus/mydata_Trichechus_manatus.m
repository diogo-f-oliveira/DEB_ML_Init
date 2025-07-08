function [data, auxData, metaData, txtData, weights] = mydata_Trichechus_manatus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Sirenia'; 
metaData.family     = 'Trichechidae';
metaData.species    = 'Trichechus_manatus'; 
metaData.species_en = 'West Indian manatee'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'0iFr', '0iMc'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiHl'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(36.4); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Lb'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 07 17];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2018 07 17]; 

%% set data
% zero-variate data

data.tg = 335; units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'AnAge';   
  temp.tg = C2K(36.4);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = 'temp from sirenian; value for florida manatee';
data.tx = 456;     units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(36.4);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 1278;   units.tp = 'd';    label.tp = 'time since birth at puberty for female'; bibkey.tp = 'AnAge';
  temp.tp = C2K(36.4);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 913;   units.tpm = 'd';    label.tpm = 'time since birth at puberty for male'; bibkey.tpm = 'AnAge';
  temp.tpm = C2K(36.4);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 69*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(36.4);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'for florida manatee';

data.Lb  = 130;     units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'Wiki';
data.Li  = 350;    units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'Wiki';

data.Wwb = 30e3; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Wiki';
data.Wwi = 600e3;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Wiki';
  comment.Wwi = 'Wiki: largest individual was 1655 kg  and measured 4.6 m';
  
data.Ri  = 0.4/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(36.4); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% t-L data
data.tL = [ ... % time since birth (yr), length (cm)
1.053	193.656
2.044	233.022
3.060	247.632
4.040	261.787
5.044	266.313
6.049	271.298
7.041	276.284
8.033	285.395
9.038	283.045];
data.tL(:,1) = 365 * (0.5 + data.tL(:,1)); % convert yr to d
units.tL  = {'d', 'cm'};  label.tL = {'time since birth', 'length'};  
temp.tL   = C2K(36.4);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'MarmOSch1996';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
weights.psd.t_0 = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;


%% Discussion points
D1 = 'Males are assumed to differ from females by E_Hm only';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'constant replacement of molar teeth, unique among mammals';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '58863'; % Cat of Life
metaData.links.id_ITIS = '180684'; % ITIS
metaData.links.id_EoL = '46559222'; % Ency of Life
metaData.links.id_Wiki = 'Trichechus_manatus'; % Wikipedia
metaData.links.id_ADW = 'Trichechus_manatus'; % ADW
metaData.links.id_Taxo = '69441'; % Taxonomicon
metaData.links.id_WoRMS = '159509'; % WoRMS
metaData.links.id_MSW3 = '11600012'; % MSW3
metaData.links.id_AnAge = 'Trichechus_manatus'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Trichechus_manatus}}';
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
bibkey = 'MarmOSch1996'; type = 'Article'; bib = [ ... 
'author = {M. Marmontel and T. J. O''Schea and H. I. Kochman and S. R. Humphrey}, ' ... 
'year = {1996}, ' ...
'title = {Age determination in manatees using growth-layer-group counts in bone}, ' ...
'journal = {Mar. Mamm. Sci.}, ' ...
'volume = {12}, ' ...
'pages = {54--88}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Trichechus_manatus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

