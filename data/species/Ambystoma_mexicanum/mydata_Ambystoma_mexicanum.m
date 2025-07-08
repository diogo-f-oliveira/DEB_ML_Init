function [data, auxData, metaData, txtData, weights] = mydata_Ambystoma_mexicanum

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Caudata'; 
metaData.family     = 'Ambystomatidae';
metaData.species    = 'Ambystoma_mexicanum'; 
metaData.species_en = 'Axolotl'; 

metaData.ecoCode.climate = {'Cwc'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFl'};
metaData.ecoCode.embryo  = {'Fc'};
metaData.ecoCode.migrate = {'TT'};
metaData.ecoCode.food    = {'biCii'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(17); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {}; 

metaData.COMPLETE = 1.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2017 10 17];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 10 17]; 


%% set data
% zero-variate data

data.ab = 12;  units.ab = 'd';    label.ab = 'age at birth';                      bibkey.ab = 'ADW';
  temp.ab = C2K(17);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 548;  units.tp = 'd';    label.tp = 'time since birth at puberty';  bibkey.tp = 'AnAge';
  temp.tp = C2K(17);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 17*365;  units.am = 'd';    label.am = 'life span';                     bibkey.am = 'AnAge';   
  temp.am = C2K(17);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 1.0;  units.Lb  = 'cm';  label.Lb  = 'SVL at birth';                    bibkey.Lb  = 'axolotl';
data.Lp  = 18;  units.Lp  = 'cm';  label.Lp  = 'SVL at puberty for males';         bibkey.Lp  = 'axolotl'; 
data.Li  = 30;  units.Li  = 'cm';  label.Li  = 'ultimate total length';            bibkey.Li  = 'Wiki';
  comment.Li = '23 cm is most common, >30 cm is rare, Wiki gives 45 cm, axolotl gives 43 cm';

  
data.Wwb = 4.2e-3; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';            bibkey.Wwb = 'axolotl';
  comment.Wwb = 'based on egg diameter of 2 mm: pi/6*0.2^3';
data.Wwi = 110;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females'; bibkey.Wwi = 'EoL';

data.Ri = 1000/365; units.Ri = '#/d';   label.Ri = 'reprod rate at 25.3 g';         bibkey.Ri = 'axolotl';
  temp.Ri = C2K(17);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 


%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M = 5 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'Only native to lakes Xochimilco and Chalco in central Mexico (elevation: ~ 2,274 m)';
metaData.bibkey.F1 = 'Wiki'; 
F2 = 'Temperature never above 20 C, falls to 6 till 7 in winter';
metaData.bibkey.F2 = 'Wiki'; 
F3 = 'Axolotls exhibit neoteny';
metaData.bibkey.F3 = 'Wiki'; 
F4 = 'Females mature 2 month later than males';
metaData.bibkey.F4 = 'axolotl'; 
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3,'F4',F4);

%% Links
metaData.links.id_CoL = 'CQ4M'; % Cat of Life
metaData.links.id_ITIS = '586244'; % ITIS
metaData.links.id_EoL = '1019571'; % Ency of Life
metaData.links.id_Wiki = 'Ambystoma_mexicanum'; % Wikipedia
metaData.links.id_ADW = 'Ambystoma_mexicanum'; % ADW
metaData.links.id_Taxo = '93027'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_amphweb = 'Ambystoma+mexicanum'; % AmphibiaWeb
metaData.links.id_AnAge = 'Ambystoma_mexicanum'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Ambystoma_mexicanum}}';
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
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{http://amphibiaweb.org/species/3842}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'caudata'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.caudata.org/cc/species/Ambystoma/A_mexicanum.shtml}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{http://eol.org/pages/1019571/details}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'axolotl'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.axolotl.org/biology.htm}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Ambystoma_mexicanum/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Ambystoma_mexicanum}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


