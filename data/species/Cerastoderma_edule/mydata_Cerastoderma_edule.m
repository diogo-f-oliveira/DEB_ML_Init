function [data, auxData, metaData, txtData, weights] = mydata_Cerastoderma_edule

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Bivalvia'; 
metaData.order      = 'Cardiida'; 
metaData.family     = 'Cardiidae';
metaData.species    = 'Cerastoderma_edule'; 
metaData.species_en = 'Common cockle'; 

metaData.ecoCode.climate = {'MB', 'MC'};
metaData.ecoCode.ecozone = {'MAE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMb', 'jiMi'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(13); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wdp'; 'Wdi'; 'rB'; 'Ri'}; 
metaData.data_1     = {}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Dina Lika'};    
metaData.date_subm = [2009 07 01];              
metaData.email    = {'lika@biology.uoc.gr'};            
metaData.address  = {'University of Crete'};   

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2011 09 23];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2015 12 07]; 

%% set data
% zero-variate data

data.ab = 3;      units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'Card2007';   
  temp.ab = C2K(14);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 280;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'Card2009';
  temp.tp = C2K(12);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 5160;   units.am = 'd';    label.am = 'life span';                bibkey.am = 'FreiCard2009';   
  temp.am = C2K(7);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'Data fro Norway';

data.Lb  = 0.015; units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'Card2007';
data.Lp  = 1.2;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'Card2009';
data.Li  = 5.0;   units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'Card2007';

data.Wdp = 0.0098;units.Wdp = 'g';   label.Wdp = 'dry weight at puberty';   bibkey.Wdp = 'Card2009';
data.Wdi = 0.9;   units.Wdi = 'g';   label.Wdi = 'ultimate dry weight';     bibkey.Wdi = 'Card2009';

data.Ri  = 4657.5;units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'Honk1998';   
  temp.Ri = C2K(15); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
data.rB  = 0.001; units.rB  = '1/d'; label.rB  = 'maximum reprod rate';     bibkey.rB  = 'Card2007';   
  temp.rB = C2K(15);  units.temp.rB = 'K'; label.temp.rB = 'temperature';
  comment.rB = 'in a subtidal area of the Wadden Sea';
  
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
metaData.links.id_CoL = 'SKNF'; % Cat of Life
metaData.links.id_ITIS = '80901'; % ITIS
metaData.links.id_EoL = '46473663'; % Ency of Life
metaData.links.id_Wiki = 'Cerastoderma_edule'; % Wikipedia
metaData.links.id_ADW = 'Cerastoderma_edule'; % ADW
metaData.links.id_Taxo = '39793'; % Taxonomicon
metaData.links.id_WoRMS = '138998'; % WoRMS
metaData.links.id_molluscabase = '138998'; % molluscabase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Cerastoderma_edule}}';
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
bibkey = 'Card2007'; type = 'Phdthesis'; bib = [ ... 
'author = {Cardosa, J. M. F.}, ' ... 
'year = {2007}, ' ...
'title = {Growth and reproduction in bivalves; An Dynamic Energy Budget approach}, ' ...
'school = {Groningen University}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Honk1998'; type = 'Phdthesis'; bib = [ ... 
'author = {Honkoop, P. J. C.}, ' ... 
'year = {1998}, ' ...
'title = {Bivalve reproduction in the {W}adden {S}ea; {E}ffects of winter conditions on reproductive effort and recruitment}, ' ...
'school = {Groningen University}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'FreiCard2009'; type = 'Article'; bib = [ ... 
'author = {Freitas, V. and Cardosa, J. M. F. and Santos, S. and Campos, J. and Drent, J. and Witte, J. IJ. and Kooijman, S. A. L. M. and Veer, H. W.van der}, ' ... 
'year = {2009}, ' ...
'title = {Analysis of food conditions for {N}ortheast {A}tlantic bivalve species based on {D}ynamic {E}nergy {B}udget theory}, ' ...
'journal = {J. Sea Res.}, ' ...
'volume = {62}, ' ...
'pages = {75--82}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'FreiCard2011'; type = 'Article'; bib = [ ... 
'author = {Freitas, V. and Cardosa, J. M. F. and Lika, D. and Peck, M. and Campos, J. and Kooijman, S. A. L. M. and Veer, H. W.van der}, ' ... 
'year = {2011}, ' ...
'title = {Temperature tolerance and energetics, a {D}ynamic {E}nergy {B}udget-based comparison of {N}orth {A}tlantic marine species}, ' ...
'journal = {Phil. Trans. R. Soc. B}, ' ...
'volume = {365}, ' ...
'pages = {3553--3565}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Card2009'; type = 'Misc'; bib = [ ...
'author = {Cardosa, J. M. F.}, ' ...
'year = {2009}, ' ...
'note = {presonal observation}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

