function [data, auxData, metaData, txtData, weights] = mydata_Phocoena_phocoena

%% set  metadata 
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Cetartiodactyla'; 
metaData.family     = 'Phocoenidae';
metaData.species    = 'Phocoena_phocoena'; 
metaData.species_en = 'Harbour porpoise'; 

metaData.ecoCode.climate = {'ME', 'MC'};
metaData.ecoCode.ecozone = {'MPSW', 'MPSE'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiCvf', 'xiCic', 'xiCik'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37);% K, body temperature
metaData.data_0     = {'tg'; 'ap'; 'am'; 'Lb'; 'Lx'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'; 't-Le' }; 

metaData.COMPLETE = 2.7; % using criteria of LikaKear2011

metaData.author   = {'Chris Klok'; 'Bas Kooijman'};                            
metaData.date_subm = [2009 07 12];                          
metaData.email    = {'Chris.Klok@wur.nl'; 'bas.kooijman@vu.nl'};                 
metaData.address  = {'IMARES, Wageningen'; 'VU University Amsterdam, 1081 HV, Netherlands'};    

metaData.author_mod_1  = {'Bas Kooijman'};          
metaData.date_mod_1    = [2015 03 08];                  
metaData.email_mod_1   = {'bas.kooijman@vu.nl'};        
metaData.address_mod_1 = {'VU University Amsterdam, 1081 HV, Netherlands'}; 

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2     = [2016 10 15];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University Amsterdam'};   

metaData.author_mod_3   = {'Bas Kooijman'};    
metaData.date_mod_3     = [2021 11 18];              
metaData.email_mod_3    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_3  = {'VU University Amsterdam'};   

metaData.author_mod_4   = {'Bas Kooijman'};    
metaData.date_mod_4     = [2023 08 13];              
metaData.email_mod_4    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_4  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 08 13];  

%% set data
% zero-variate data
data.tg = 10.4*30.5; units.tg = 'd';  label.tg = 'gestation time';     bibkey.tg = 'BorjRead2003';    
  temp.tg = C2K(37); units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tp = 3.6*365;   units.tp = 'd';  label.tp = 'time since birth at puberty'; bibkey.tp = 'Read1990';
  temp.tp = C2K(37); units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'Maturation 3.6 yr at 142cm length LockHeid2001, 3.15 to 3.44 yr'; 
data.am = 13.5*365;  units.am = 'd';  label.am = 'life span';                   bibkey.am = 'AddiSmee1999';   
  temp.am = C2K(37); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb = 72.5;      units.Lb = 'cm'; label.Lb = 'total length at birth';       bibkey.Lb = 'Klok2009';
data.Lx = 101;       units.Lx = 'cm'; label.Lx = 'total length at weaning';     bibkey.Lx = 'SmitGask1974';
data.Lp = 148;       units.Lp = 'cm'; label.Lp = 'total length at puberty';     bibkey.Lp = 'AddiSmee1999';
data.Li = 173;       units.Li = 'cm'; label.Li = 'ultimate total length';       bibkey.Li = 'Klok2009';
  comment.Li = 'Largest individual from data set';

data.Wwb = 8500;     units.Wwb = 'g'; label.Wwb = 'wet weight at birth';        bibkey.Wwb = 'Klok2009';
data.Wwp = 37000;    units.Wwp = 'g'; label.Wwp = 'wet weight at puberty';      bibkey.Wwp = 'Klok2009';
data.Wwi = 55000;    units.Wwi = 'g'; label.Wwi = 'ultimate wet weight';        bibkey.Wwi = 'Klok2009';

data.Ri = .002047;   units.Ri = '#/d';label.Ri = 'maximum reprod rate';         bibkey.Ri  = 'Read1990';   
  temp.Ri = C2K(37); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'From Canadian data set';

% uni-variate data
% time - length
data.tL = [ ... dental dayers (#), total length (cm)
0.958	106.582
0.979	103.680
1.938	117.931
1.938	112.542
1.958	111.090
2.458	124.121
2.479	118.939
2.542	116.656
2.938	119.537
3.104	119.321
3.979	131.711
5.000	145.337
5.000	127.098
5.021	123.781
5.500	135.363
5.521	132.875
8.000	147.668
8.021	136.890
10.938	145.029];
data.tL(:,1) = 365 * data.tL(:,1); % convert dental layer to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(37);  units.temp.tL = 'K'; label.temp.tL = 'temperature'; 
bibkey.tL = 'Utre1978';
comment.tL = 'Ageing based on dental layers';

% time-length for foetus 
data.tLe = [ ... % time since aug 1 (d), length (cm)
113.995	18.750
129.181	19.712
145.811	25.721
160.612	28.606
175.037	32.212
191.324	34.615
206.080	43.510
257.437	63.942
266.740	58.654
272.998	64.183
290.008	68.990
332.603	71.635
350.110	59.375];
units.tLe  = {'d', 'cm'};  label.tLe = {'time since aug 1', 'length'};  
temp.tLe  = C2K(37);  units.temp.tLe = 'K'; label.temp.tLe = 'temperature';
bibkey.tLe = 'Laws1959';
comment.tLe = 'Data from Denmark and Holland';

%% set weights for all real data
weights = setweights(data, []);
weights.Wwi = 3 * weights.Wwi; % much more confidence in the ultimate wet weight
weights.tL = 5 * weights.tL;
 
%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'mod_3: tL data added';
D2 = 'mod_4: tLe data added';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Links
metaData.links.id_CoL = '77C9R'; % Cat of Life
metaData.links.id_ITIS = '180473'; % ITIS
metaData.links.id_EoL = '46559342'; % Ency of Life
metaData.links.id_Wiki = 'Phocoena_phocoena'; % Wikipedia
metaData.links.id_ADW = 'Phocoena_phocoena'; % ADW
metaData.links.id_Taxo = '68799'; % Taxonomicon
metaData.links.id_WoRMS = '137117'; % WoRMS
metaData.links.id_MSW3 = '14300116'; % MSW3
metaData.links.id_AnAge = 'Phocoena_phocoena'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Phocoena_phocoena}}';  
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
bibkey = 'AddiSmee1999'; type = 'Article'; bib = [ ...
'author = {Addink, M.J. and C. Smeenk}, ' ...
'year   = {1999}, ' ...
'title  = {The harbour porpoise \emph{Phocoena phocoena} in {D}utch coastal waters: analysis of stranding records for the period 1920-1994.}, ' ...
'journal = {Lutra}, ' ...
'volume = {41}, ' ...
'pages = {55--80}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BorjRead2003'; type = 'Article'; bib = [ ...
'author = {Borjesson, P. and Read, A.J.}, ' ...
'year   = {2003}, ' ... 
'title  = {VARIATION IN TIMING OF CONCEPTION BETWEEN POPULATIONS OF THE HARBOR PORPOISE.}, ' ...
'journal = {Journal of Mammalogy}, ' ...
'volume = {84(4)}, ' ... 
'pages = {84(3):948-955}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'LockHeid2001'; type = 'Article'; bib = [ ...
'author = {Lockyer ,C. and Heide-J{\o}rgensen, M. P. and Jensen, J. and Kinze, C. C. and Buus S{\o}rensen, T.}, ' ...
'year   = {2001}, ', ... 
'title  = {Age, length and reproductive parameters of harbour porpoises \emph{Phocoena phocoena} ({L}.) from {W}est {G}reenland}, ' ...
'journal = {ICES Journal of Marine Science}, ' ...
'volume = {58}, '... 
'page = {154-162}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Read1990'; type = 'Article'; bib = [ ...
'author = {Read, A. J.}, ' ...
'year   = {1990}, ' ... 
'title  = {Age at sexual maturity and pregnancy rates of harbour porpoises, \emph{Phocoena phocoena}, from the {B}ay of {F}undy}, ' ...
'journal = {Canadian Journal of Fisheries and Aquatic Sciences}, ' ... 
'volume = {47}, ' ...
'page = {561-565}']; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Klok2009'; type = 'Misc'; bib = [ ...
'author = {Klok, C.}, ' ...
'year   = {2009}, ' ... 
'journal = {Data base of IMARES, wageningen}'];  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SmitGask1974'; type = 'Article'; bib = [ ...
'author = {G. J. D. Smith, D. E. Gaskin}, ' ...
'year   = {1974}, ' ...
'title  = {The diet of harbor porpoises (\emph{Phocoena phocoena} ({L}.)) in coastal waters of {E}astern {C}anada, with special reference to the {B}ay of {F}undy}, ' ...
'journal = {Canadian Journal of Zoology}, ' ...
'volume = {52}, ' ...
'page = {777--782}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Utre1978'; type = 'Article'; bib = [ ...
'doi = {10.1163/26660644-04801002}, ' ...
'author = {Van Utrecht, W. L.}, ' ...
'year   = {1978}, ' ...
'title  = {Age and Growth in \emph{Phocoena phocoena} {L}innaeus, 1758 {C}etacea, {O}dontoceti) from the {N}orth {S}ea}, ' ...
'journal = {Bijdragen Tot de Dierkunde}, ' ...
'volume = {48(1}, ' ...
'page = {16–28}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Laws1959'; type = 'techreport'; bib = [ ... 
'author = {Laws, R. M.}, ' ... 
'year = {1959}, ' ...
'title = {The foetal growth rates of whales with special reference to the fin whale, \emph{Balaenoptera physalus} {L}inn}, ' ...
'institution = {Nat. Inst of Oceanography}, ' ...
'volume = {29}, ' ...
'pages = {281-308}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

