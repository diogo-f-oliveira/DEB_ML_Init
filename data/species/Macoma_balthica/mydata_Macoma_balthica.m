function [data, auxData, metaData, txtData, weights] = mydata_Macoma_balthica

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Bivalvia'; 
metaData.order      = 'Cardiida'; 
metaData.family     = 'Tellinidae';
metaData.species    = 'Macoma_balthica'; 
metaData.species_en = 'Baltic macoma'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MAE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMb', 'jiMi'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPp', 'jiD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(12); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wdp'; 'Wdi'; 'R_L'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author   = {'Dina Lika'; 'Joana Cardoso'; 'Vania Freitas'};    
metaData.date_subm = [2009 07 26];              
metaData.email    = {'lika@biology.uoc.gr'};            
metaData.address  = {'University of Crete'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1 = [2011 09 18];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2 = [2016 10 15];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2015 12 22]; 


%% set data
% zero-variate data

data.ab = 3;    units.ab = 'd';    label.ab = 'age at birth';                  bibkey.ab = 'Dren2004';   
  temp.ab = C2K(15);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 422;  units.tp = 'd';    label.tp = 'time since birth at puberty';   bibkey.tp = 'Card2009';
  temp.tp = C2K(12);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 3832; units.am = 'd';    label.am = 'life span';                     bibkey.am = 'FreiCard2009';   
  temp.am = C2K(7);   units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.015;     units.Lb  = 'cm'; label.Lb  = 'total length at birth';   bibkey.Lb  = 'BosPhil2007';
data.Lp  = 1;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';      bibkey.Lp  = 'HonkMeer1998';
data.Li  = 2.8; units.Li  = 'cm';  label.Li  = 'ultimate total length';        bibkey.Li  = 'Dekk2009';

data.Wdp = 0.0047;    units.Wdp = 'g';  label.Wdp = 'dry weight at puberty';   bibkey.Wdp = 'Card2009';
data.Wdi = 0.131;     units.Wdi = 'g';  label.Wdi = 'ultimate dry weight';     bibkey.Wdi = 'FreiCard2009';

data.R16 = 158.9; units.R16  = '#/d';   label.R16  = 'reprod rate at 1.64 cm'; bibkey.R16 = 'HonkMeer1997';   
  temp.R16 = C2K(12);  units.temp.R16 = 'K'; label.temp.R16 = 'temperature';
 
% uni-variate data
% t-L data
data.tL = [ ... % time since birth (a), length (mm)
0.001       0.744289
0.192519	9.681621
0.497780	16.745288
0.827176	19.954181
1.188032	20.882182
1.485162	21.358840
1.838839	21.624437];
data.tL(:,1) = data.tL(:,1) * 365; % convert a to d
data.tL(:,2) = data.tL(:,2)/ 10;  % convert mm to cm
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'shell length'};  
temp.tL    = C2K(12);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Gilb1973';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tL = 50 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;

%% Links
metaData.links.id_CoL = '6QB87'; % Cat of Life
metaData.links.id_ITIS = '567846'; % ITIS
metaData.links.id_EoL = '590151'; % Ency of Life
metaData.links.id_Wiki = 'Limecola_balthica'; % Wikipedia
metaData.links.id_ADW = 'Macoma_balthica'; % ADW
metaData.links.id_Taxo = '39503'; % Taxonomicon
metaData.links.id_WoRMS = '880017'; % WoRMS
metaData.links.id_molluscabase = '880017'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Macoma_balthica}}';
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
bibkey = 'Gilb1973'; type = 'Article'; bib = [ ... 
'author = {Gilbert, M. A.}, ' ... 
'year = {1973}, ' ...
'title = {Growth rate, longevity and maximum size of \emph{Macoma baltica} ({L}.)}, ' ...
'journal = {Biol. Bull. (woods Hole)}, ' ...
'volume = {145}, ' ...
'pages = {119--126}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'HonkMeer1998'; type = 'Article'; bib = [ ... 
'author = {Honkoop, P. J. C. and van der Meer, J. and Beukema, J. J. and Kwast, D.}, ' ... 
'year = {1998}, ' ...
'title = {Does temperature-influenced egg production predict the recruitment in the bivalve \emph{Macoma balthica}?}, ' ...
'journal = {Marine Ecology Progress Series}, ' ...
'volume = {164}, ' ...
'pages = {229--235}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Dren2004'; type = 'Phdthesis'; bib = [ ... 
'author = {Drent, J.}, ' ... 
'year = {2004}, ' ...
'title = {Life history variation of a marine bivalve (\emph{Macoma balthica}) in a changing world.}, ' ...
'school = {Rijksuniversiteit Groningen}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BosPhil2007'; type = 'Article'; bib = [ ... 
'author = {Bos, O. G. and Philippart, C. J. M. and Van der Meer, J.}, ' ... 
'year = {2007}, ' ...
'title = {Effects of temporary food limitation on development and mortality of \emph{Macoma balthica} larvae.}, ' ...
'journal = {Mar. Ecol. Prog. Ser.}, ' ...
'volume = {330}, ' ...
'pages = {155--162}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'HonkMeer1997'; type = 'Article'; bib = [ ... 
'author = {Honkoop, P. J. C. and Van der Meer, J.}, ' ... 
'year = {1997}, ' ...
'title = {Reproductive output of \emph{Macoma balthica} populations in relation to winter-temperature and intertidal-height mediated changes of body mass}, ' ...
'journal = {Mar. Ecol. Prog. Ser}, ' ...
'volume = {149}, ' ...
'pages = {155--162}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'FreiCard2009'; type = 'Article'; bib = [ ... 
'author = {Freitas, V. and Cardoso, J. F. M. F. and Santos, S. and Campos, J. and Drent, J. and Saraiva, S. and Witte, J. I. and Kooijman, S. A. L. M. and Van der Veer, H. W.}, ' ... 
'year = {2009}, ' ...
'title = {Reconstruction of food conditions for {N}ortheast {A}tlantic bivalve species based on {D}ynamic {E}nergy {B}udgets}, ' ...
'journal = {J. Sea Res.}, ' ...
'volume = {62}, ' ...
'pages = {75--82}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Card2009'; type = 'Misc'; bib = ...
'note = {Observations by Joanna Cardoso}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Dekk2009'; type = 'Misc'; bib = ...
'note = {Observations by Dekker}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

