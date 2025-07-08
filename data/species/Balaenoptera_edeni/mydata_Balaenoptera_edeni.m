function [data, auxData, metaData, txtData, weights] = mydata_Balaenoptera_edeni

%% set metadata 
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Cetartiodactyla'; 
metaData.family     = 'Balaenopteridae';
metaData.species    = 'Balaenoptera_edeni'; 
metaData.species_en = 'Bryde''s whale'; 

metaData.ecoCode.climate = {'MA', 'MB'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {'Ml'};
metaData.ecoCode.food    = {'bxM', 'xiCvf', 'xiCic', 'xiCik'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37);% K, body temperature
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};  
metaData.data_1     = {}; 

metaData.COMPLETE = 2.2; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                            
metaData.date_subm = [2023 08 20];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV, Netherlands'};    

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 08 20];  

%% set data
% zero-variate data
data.tg = 365;     units.tg = 'd';    label.tg = 'gestation time';                     bibkey.tg = 'Wiki';    
  temp.tg = C2K(37); units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx =  9*30.5;      units.tx = 'd';    label.tx = 'time since birth at weaning';      bibkey.tx = 'Wiki';    
  temp.tx = C2K(37);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = '6-12 mnth';
data.tp = 9.5*365;    units.tp = 'd';    label.tp = 'time since birth at puberty for females'; bibkey.tp = 'Wiki';
  temp.tp = C2K(37); units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = '8-11 yr'; 
data.am = 72*365;   units.am = 'd';    label.am = 'life span';                          bibkey.am = 'AnAge';   
  temp.am = C2K(37); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb = 370;     units.Lb = 'cm';   label.Lb = 'total length at birth';               bibkey.Lb = 'Wiki';
  comment.Lb = '3.4-4 m';
data.Lp = 1307;    units.Lp = 'cm';   label.Lp = 'total length at puberty';             bibkey.Lp = 'Wiki';
data.Lpm = 1301;    units.Lpm = 'cm';   label.Lpm = 'total length at puberty';          bibkey.Lpm = 'Wiki';
data.Li = 1551;    units.Li = 'cm';   label.Li = 'ultimate total length for female';    bibkey.Li = 'Wiki';
data.Lim = 1456;    units.Lim = 'cm';   label.Lim = 'ultimate total length for male';   bibkey.Lim = 'Wiki';

data.Wwb = 1e6; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';                   bibkey.Wwb = 'Wiki';
data.Wwi = 20e6;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = 'Wiki';
  comment.Wwi = '12-25 ton';

data.Ri = 0.5/365;  units.Ri = '#/d';  label.Ri = 'maximum reprod rate';                 bibkey.Ri = 'AnAge';   
  temp.Ri = C2K(37); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

%% set weights for all real data
weights = setweights(data, []);
weights.Wwb = 0 * weights.Wwb;

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
D2 = 'Wwb was ignorned due to inconsistency with the combination Lb, Li and Wwi';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = 'KF8Q'; % Cat of Life
metaData.links.id_ITIS = '180525'; % ITIS
metaData.links.id_EoL = '46559432'; % Ency of Life
metaData.links.id_Wiki = 'Balaenoptera_edeni'; % Wikipedia
metaData.links.id_ADW = 'Balaenoptera_edeni'; % ADW
metaData.links.id_Taxo = '68888'; % Taxonomicon
metaData.links.id_WoRMS = '137089'; % WoRMS
metaData.links.id_MSW3 = '14300017'; % MSW3
metaData.links.id_AnAge = 'Balaenoptera_edeni'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.Wikipedia.org/wiki/Balaenoptera_edeni}}';
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
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Balaenoptera_edeni}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
