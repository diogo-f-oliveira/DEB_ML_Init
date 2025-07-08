function [data, auxData, metaData, txtData, weights] = mydata_Corydoras_aeneus

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Siluriformes'; 
metaData.family     = 'Callichthyidae';
metaData.species    = 'Corydoras_aeneus'; 
metaData.species_en = 'Bronze catfish'; 

metaData.ecoCode.climate = {'A'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iFm'};
metaData.ecoCode.embryo  = {'Fc', 'Fh'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'jiHl'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2011 02 22];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};      

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2016 10 18];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 10 18]; 

%% set data
% zero-variate data
data.ab = 3;      units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'HuysMoer2009'; 
  temp.ab = C2K(25); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 150;    units.tp = 'd';    label.tp = 'time since birth at puberty';  bibkey.tp = 'guess';
  temp.tp = C2K(25); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 5*365;  units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(25); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lh = 0.35;   units.Lh = 'cm';   label.Lh = 'total length at hatch';  bibkey.Lh = 'HuysMoer2009';
data.Lb = 0.57;   units.Lb = 'cm';   label.Lb = 'total length at birth';  bibkey.Lb = 'HuysMoer2009';
data.Lp = 5;      units.Lp = 'cm';   label.Lp = 'total length at puberty';bibkey.Lp = 'Kooy2010';
data.Li = 7;      units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'aquafish';

data.Wwb = 6.4e-4; units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'HuysMoer2009';
  comment.Wwb = 'computed as 1.2*(.57/7)^3';
data.Wwp = 1.164;  units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';  bibkey.Wwp = 'guess';
data.Wwi = 3.2;    units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'guess';
  
data.Ri = 150 * 4/ 365; units.Ri = '#/d'; label.Ri = 'max reprod rate'; bibkey.Ri = {'fishbase','guess'};  
  temp.Ri = C2K(25); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'several spawnings per season';
    
% uni-variate data
% univariate data
% t-L data from HuysMoer2009 at 25 C
data.tL = [ ... % 10 log time since birth (d), standard length (mm)
-1.399	0.539
-1.084	0.539
-0.930	0.549
-0.170	0.595
-0.004	0.605
0.305	0.686
0.471	0.710
0.596	0.717
0.691	0.749
0.774	0.793
0.852	0.814
0.887	0.831
0.994	0.846
0.953	0.871
1.036	0.900
1.113	0.937
1.078	0.947
1.144	0.988
1.203	1.049
1.251	1.049
1.299	1.093
1.334	1.129
1.400	1.141
1.382	1.193
1.442	1.202
1.459	1.173
1.477	1.192
1.519	1.210
1.567	1.266
1.614	1.271
1.650	1.280
1.698	1.302
1.745	1.315
1.775	1.297
1.798	1.303
1.781	1.354
1.852	1.341
1.894	1.353
1.959	1.369
2.084	1.451];
data.tL = 10.^data.tL; % convert from log10 to normal
data.tL(:,2) = data.tL(:,2)/10; % convert from mm to cm
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'standard length'};  
  temp.tL = C2K(25); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = {'HuysMoer2009'};

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% Facts
F1 = 'The genus can extract oxygen from air using a highly vascularised portion of the gastrointestinal tract';
metaData.bibkey.F1    = 'Wiki';
metaData.facts = struct('F1',F1);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Links
metaData.links.id_CoL = '6B6VD'; % Cat of Life
metaData.links.id_ITIS = '164292'; % ITIS
metaData.links.id_EoL = '216685'; % Ency of Life
metaData.links.id_Wiki = 'Corydoras_aeneus'; % Wikipedia
metaData.links.id_ADW = 'Corydoras_aeneus'; % ADW
metaData.links.id_Taxo = '44138'; % Taxonomicon
metaData.links.id_WoRMS = '1014877'; % WoRMS
metaData.links.id_fishbase = 'Corydoras-aeneus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Corydoras_aeneus}}';  
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
bibkey = 'HuysMoer2009'; type = 'Article'; bib = [ ...    
'author = {Huysentruyt, F. and Moerkerke, B. and Devaere, S. and Zrdiaens, D.}, ' ...
'year  = {2009}, ' ...
'title = {Early development and allometric growth in the armoured catfish \emph{Corydoras aeneus} ({G}ill, 1858)}, ' ...  
'journal = {Hydrobiologia}, ' ...
'doi = {10.1007/s10750-009-9714-z}, ' ...
'volume = {627}, ' ...
'pages = {45-54}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'aquafish'; type = 'Misc'; bib = ...
'howpublished = {\url{http://aquariumfishfoodsupplies.co.za/article/the-bronze-corydoras/}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Corydoras-aeneus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

