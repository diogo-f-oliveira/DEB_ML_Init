  function [data, auxData, metaData, txtData, weights] = mydata_Salmo_trutta

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Salmoniformes'; 
metaData.family     = 'Salmonidae';
metaData.species    = 'Salmo_trutta'; 
metaData.species_en = 'Brown trout'; 

metaData.ecoCode.climate = {'MC','Cfb','Dfb','Dfc'};
metaData.ecoCode.ecozone = {'MAE','TH'};
metaData.ecoCode.habitat = {'0jFr','jiMpe'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {'Mda','Mp'};
metaData.ecoCode.food    = {'bjCi', 'jiCic', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(8); % K, body temp
metaData.data_0     = {'ab_T'; 'ap'; 'am'; 'Lh'; 'Lb'; 'Lp'; 'Li'; 'Ri'}; 
metaData.data_1     = {'L-Ww'; 'T-ah'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Jan-Erik Thrane'};        
metaData.date_subm = [2009 11 15];                           
metaData.email    = {'j.e.thrane@bio.uio.no'};                 
metaData.address  = {'Inst. Biol., Univ. Oslo'}; 

metaData.author_mod_1  = {'Bas Kooijman'};                  
metaData.date_mod_1    = [2013 04 05];                      
metaData.email_mod_1   = {'bas.kooijman@vu.nl'};      
metaData.address_mod_1 = {'VU University Amsterdam'}; 

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2     = [2016 10 27];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2015 11 06]; 

%% set data
% zero-variate data
data.ab_4 = 106 + 11; units.ab_4 = 'd';  label.ab_4 = 'age at birth at 4C';         bibkey.ab_4 = 'OjanBran2003'; 
  temp.ab_4 = C2K(4); units.temp.ab_4 = 'K'; label.temp.ab_4 = 'temperature';
data.ab_8 = 52 + 11;  units.ab_8 = 'd';  label.ab_8 = 'age at birth at 8C';         bibkey.ab_8 = 'OjanBran2003'; 
  temp.ab_8 = C2K(8); units.temp.ab_8 = 'K'; label.temp.ab_8 = 'temperature';
data.ap = 3*365;      units.ap = 'd';    label.ap = 'age at puberty';         bibkey.ap = {'OjanBran2003', 'Elli1984'};
  temp.ap = C2K(8);  units.temp.ap = 'K'; label.temp.ap = 'temperature';
  comment.ap = 'Very variable (1 - 10 years), but usually 2-3 years';
data.am = 10*365;     units.am = 'd';    label.am = 'life span';              bibkey.am = {'KlemAmun2003'};   
  temp.am = C2K(8); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lh = 1.5;        units.Lh = 'cm';   label.Lh = 'total length at hatch';  bibkey.Lh = 'OjanBran2003'; 
data.Lb = 2;          units.Lb = 'cm';   label.Lb = 'total length at birth';  bibkey.Lb = 'KlemAmun2003'; 
data.Lp = 35;         units.Lp = 'cm';   label.Lp = 'total length at puberty';bibkey.Lp = 'KlemAmun2003'; 
  comment.Lp = 'Extremely variable, but a mean value from south-eastern norway';
data.Li = 110;        units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = {'Elli1994'};

data.Ri = 2e3/365;    units.Ri = '#/d';  label.Ri = 'maximum reprod rate';    bibkey.Ri = {'Elli1984'};   
  temp.Ri = C2K(8); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
    
% uni-variate data
% ah vs T (ref: OjanBran2003)
data.Tah = [2 4 6 8 10;    % T, temp (C)
        183 106 72 52 40]'; % age at hatch at T
data.Tah(:,1) =  C2K(data.Tah(:,1)); % convert C to K 
units.Tah = {'K', 'd'}; label.Tah = {'temperature', 'age at hatch'}; bibkey.Tah = {'OjanBran2003'};

% weight vs length (ref: Elli1975)
% edited by Bas Kooijman: added 800 g for 40 cm since number of weights did not match number of lengths
data.LW = [10 15  20  25  30  35 40; % Length (cm)
	    34 78 147 246 380 555 800]'; % weight (g)
units.LW = {'cm', 'g'}; label.LW = {'length', 'wet weight'}; bibkey.LW = {'Elli1975'};
 
%% set weights for all real data
weights = setweights(data, []);
weights.Li = 10 * weights.Li;
weights.Lp = 10 * weights.Lp;
weights.Lb = 10 * weights.Lb;
weights.Tah = 10 * weights.Tah;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'The alevin hatches from the egg, but is fed by yolk 7 - 30 days before external feeding starts';
metaData.bibkey.F1 = 'KlemAmun2003'; 
metaData.facts = struct('F1',F1);
                                 
%% Links
metaData.links.id_CoL = '79CZL'; % Cat of Life
metaData.links.id_ITIS = '161997'; % ITIS
metaData.links.id_EoL = '206777'; % Ency of Life
metaData.links.id_Wiki = 'Salmo_trutta'; % Wikipedia
metaData.links.id_ADW = 'Salmo_trutta'; % ADW
metaData.links.id_Taxo = '42823'; % Taxonomicon
metaData.links.id_WoRMS = '127187'; % WoRMS
metaData.links.id_fishbase = 'Salmo-trutta'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Salmo_trutta}}';  
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
bibkey = 'OjanBran2003'; type = 'Article'; bib = [ ...  
'author = {Ojanguren, A. F. and Brana, F}, ' ...
'year = {2003}, ' ...
'title = {Thermal dependence of embryonic growth and development in brown trout}, ' ... 
'howpublished = {\url{http://onlinelibrary.wiley.com/doi/10.1046/j.1095-8649.2003.00049.x/pdf}}, ' ...
'journal = {Journal of fish biology}, ' ...
'volume = 62, '...
'pages = {580--590}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Elli1984'; type = 'Article'; bib = [ ...  
'author = {Elliot, J. M.}, ' ...
'year = {1984}, ' ...
'title = {Numerical Changes and Population Regulation in Young Migratory Trout \emph{Salmo trutta} in a {L}ake {D}istrict Stream, 1966-83.}, ' ... 
'journal = {Journal of animal ecology}, ' ...
'howpublished = {\url{http://www.jstor.org/stable/pdf/4360.pdf?acceptTC=true}}, ' ...
'volume = 53, '...
'pages = {327--350}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Elli1994'; type = 'Book'; bib = [ ...    
'author = {Elliot, J. M.}, ' ...
'year  = {1994}, ' ...
'title = {Quantitative ecology and the brown trout.}, ' ...  
'publisher = {Oxford University Press, USA}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'KlemAmun2003'; type = 'Article'; bib = [ ...    
'author = {Klemetrsen, A. and Amundsen, P.-A. and Dempson, J. B. and Jonsson, N. and O"Connell, M. F. and Mortensen, E.}, ' ...
'year  = {2003}, ' ...
'title = {Atlantic salmon \emph{Salmo salar} {L}., brown trout, \emph{Salmo trutta} {L}. and {A}rctic charr \emph{Salvelinus alpinus} ({L}.): a review of aspects of their life histories}, ' ...  
'howpublished = {\url{http://onlinelibrary.wiley.com/doi/10.1034/j.1600-0633.2003.00010.x/pdf}}, ' ...
'journal = {Ecology of freshwater fish}, ' ...
'volume = {12}, ' ...
'pages = {1--59}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Brow1946'; type = 'Book'; bib = [ ...    
'author = {Brown, M. E.}, ' ...
'year  = {1945}, ' ...
'title = {The growth of brown trout. I: factors influencing the growth of trout fry}, ' ...  
'journal = {Journal of experimental biology}, ' ...
'volume = {22}, ' ...
'pages = {118--129}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BigeBrad1963'; type = 'Book'; bib = [ ...    
'author = {Bigelow, H. B. and M. G. Bradbury and J. R. Dymond and J. R. Greeley and S. F. Hildebrand and G. W. Mead and R. R. Miller and L. R. Rivas and W. L. Schroeder and R. D. Suttkus and V. D. Vladykov}, ' ...
'year  = {1963}, ' ...
'title = {Fishes of the western {N}orth {A}tlantic. {P}art three}, ' ...  
'publisher = {Mar. Res., Yale Univ. }, ' ...
'address = {New Haven, Sears Found}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'JonsJons1998'; type = 'Article'; bib = [ ...    
'author = {Jonsson, N. and Jonsson, B.}, ' ...
'year  = {1998}, ' ...
'title = {Body composition and energy allocation in life-history stages of brown trout.}, ' ...  
'journal = {Journal of fish biology}, ' ...
'volume = {53}, ' ...
'pages = {1306--1316}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Elli1975'; type = 'Article'; bib = [ ...    
'author = {Elliot, J. M.}, ' ...
'year  = {1975}, ' ...
'title = {The Growth Rate of Brown Trout (\emph{Salmo trutta} {L}.) Fed on Maximum Rations.}, ' ...  
'journal = {Journal of Animal Ecology}, ' ...
'volume = {44}, ' ...
'pages = {805--821}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  