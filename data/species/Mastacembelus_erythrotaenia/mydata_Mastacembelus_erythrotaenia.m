function [data, auxData, metaData, txtData, weights] = mydata_Mastacembelus_erythrotaenia

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Synbranchiformes'; 
metaData.family     = 'Mastacembelidae';
metaData.species    = 'Mastacembelus_erythrotaenia'; 
metaData.species_en = 'Fire eel'; 

metaData.ecoCode.climate = {'Am'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0iFm'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCii', 'biHl'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28); % K, body temp
metaData.data_0     = {'ah'; 'ab'; 'ap'; 'am'; 'Lh'; 'Lp'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {}; 

metaData.COMPLETE = 2.0; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2014 05 11];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2016 10 30];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 10 30]; 

%% set data
% zero-variate data

data.ah = 72/24;     units.ah = 'd';    label.ah = 'age at hatch';              bibkey.ah = 'fishchannel';   
  temp.ah = C2K(28);  units.temp.ah = 'K'; label.temp.ah = 'temperature';
data.ab = data.ah + 3; units.ab = 'd';  label.ab = 'age at birth';              bibkey.ab = 'fishchannel';   
  temp.ab = C2K(28);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.ap = 1.5 * 365; units.ap = 'd';    label.ap = 'age at puberty';            bibkey.ap = 'guess';
  temp.ap = C2K(28); units.temp.ap = 'K'; label.temp.ap = 'temperature';
data.am = 10 * 365;  units.am = 'd';    label.am = 'life span';                 bibkey.am = 'Wiki';   
  temp.am = C2K(28); units.temp.am = 'K'; label.temp.am = 'temperature'; 

%data.L0  = 0.1;      units.L0  = 'cm';  label.L0  = 'egg diameter';             bibkey.L0  = 'Wiki';  
data.Lh  = 0.4;      units.Lh  = 'cm';  label.Lh  = 'total length at hatch';    bibkey.Lh  = 'Wiki';  
data.Lp  = 51;       units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'Wiki'; 
data.Li  = 120;      units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'Wiki';

data.Wwi = 7000;     units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'Wiki';

data.Ri  = 1200/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';      bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(28); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;

%% Links
metaData.links.id_CoL = '3YCJS'; % Cat of Life
metaData.links.id_ITIS = '172695'; % ITIS
metaData.links.id_EoL = '224257'; % Ency of Life
metaData.links.id_Wiki = 'Mastacembelus_erythrotaenia'; % Wikipedia
metaData.links.id_ADW = 'Mastacembelus_erythrotaenia'; % ADW
metaData.links.id_Taxo = '46876'; % Taxonomicon
metaData.links.id_WoRMS = '1021164'; % WoRMS
metaData.links.id_fishbase = 'Mastacembelus-erythrotaenia'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Mastacembelus_erythrotaenia}}';
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
bibkey = 'fishchannel'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishchannel.com/freshwater-aquariums/fish-breeding/breeding-freshwater-eels.aspx}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

