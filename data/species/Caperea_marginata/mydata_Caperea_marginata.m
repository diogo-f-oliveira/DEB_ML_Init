function [data, auxData, metaData, txtData, weights] = mydata_Caperea_marginata
%% set metadata 
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Cetartiodactyla'; 
metaData.family     = 'Neobalaenidae';
metaData.species    = 'Caperea_marginata'; 
metaData.species_en = 'Pygmy right whale'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MAS','MIS','MPS'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {'Ml'};
metaData.ecoCode.food    = {'bxM', 'xiCvf', 'xiCic', 'xiCik'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37);% K, body temperature
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Lb'; 'Lx'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};  
metaData.data_1     = {}; 

metaData.COMPLETE = 1.8; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                            
metaData.date_subm = [2023 08 20];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV, Netherlands'};    

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 08 20];  

%% set data
% zero-variate data
data.tg = 320;     units.tg = 'd';    label.tg = 'gestation time';                     bibkey.tg = 'guess';    
  temp.tg = C2K(37); units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = 'based on v = 0.04 cm/d';
data.tx =  365;      units.tx = 'd';    label.tx = 'time since birth at weaning';      bibkey.tx = 'guess';    
  temp.tx = C2K(37);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = '';
data.tp = 10*365;    units.tp = 'd';    label.tp = 'time since birth at puberty for females'; bibkey.tp = 'guess';
  temp.tp = C2K(37); units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'based on v = 0.04 cm/d';
data.am = 70*365;   units.am = 'd';    label.am = 'life span';                          bibkey.am = 'guess';   
  temp.am = C2K(37); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'based on Eschrichtius_robustus';

data.Lb = 180;     units.Lb = 'cm';   label.Lb = 'total length at birth';               bibkey.Lb = 'Wiki';
  comment.Lb = '1.6-2.2 m';
data.Lx = 325;     units.Lx = 'cm';   label.Lx = 'total length at weaning';               bibkey.Lx = 'Wiki';
  comment.Lx = '3-3.5 m';
data.Lp = 550;    units.Lp = 'cm';   label.Lp = 'total length at puberty';             bibkey.Lp = 'Wiki';
  comment.Lp = '5-6 m';
data.Li = 625;    units.Li = 'cm';   label.Li = 'ultimate total length for female';    bibkey.Li = 'Wiki';
  comment.Li = '6-6.5 m; longest female 645 cm, longest male 610 cm';

data.Wwb = 76.5e3; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';                  bibkey.Wwb = 'guess';
  comment.Wwb = 'based on (Lb/Li)^3*Wwi';
data.Wwi = 3.2e6;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';      bibkey.Wwi = 'Wiki';
  comment.Wwi = '3-3.5 ton';

data.Ri = 1/365/2;  units.Ri = '#/d';  label.Ri = 'maximum reprod rate';                 bibkey.Ri = 'guess';   
  temp.Ri = C2K(37); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Eschrichtius_robustus';

%% set weights for all real data
weights = setweights(data, []);

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
D1 = 'males are assumed not to differ from females due to  lack of data';
metaData.discussion = struct('D1',D1);

%% Links
metaData.links.id_CoL = 'QQ4Y'; % Cat of Life
metaData.links.id_ITIS = '180535'; % ITIS
metaData.links.id_EoL = '46559452'; % Ency of Life
metaData.links.id_Wiki = 'Caperea_marginata'; % Wikipedia
metaData.links.id_ADW = 'Caperea_marginata'; % ADW
metaData.links.id_Taxo = '68907'; % Taxonomicon
metaData.links.id_WoRMS = '231424'; % WoRMS
metaData.links.id_MSW3 = '14300033'; % MSW3
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.Wikipedia.org/wiki/Caperea_marginata}}';
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

