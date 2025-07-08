function [data, auxData, metaData, txtData, weights] = mydata_Hesperoedura_reticulata

%% set metaData
metaData.phylum     = 'Chordata';
metaData.class      = 'Reptilia';
metaData.order      = 'Squamata';
metaData.family     = 'Diplodactylidae';
metaData.species    = 'Hesperoedura_reticulata';
metaData.species_en = 'Reticulated velvet gecko';

metaData.ecoCode.climate = {'Cfa','Cfb'};
metaData.ecoCode.ecozone = {'TA'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tnp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dtfm'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'};

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 02 14];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 02 14];

%% set data
% zero-variate data;
data.ab = 31;     units.ab = 'd'; label.ab = 'age at birth';               bibkey.ab = 'guess';
  temp.ab = C2K(25);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 4*365;  units.tp = 'd'; label.tp = 'time since birth at puberty for females'; bibkey.tp = 'HowKitc1982';
  temp.tp = C2K(25);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 3*365;  units.tpm = 'd'; label.tpm = 'time since birth at puberty for males'; bibkey.tpm = 'HowKitc1982';
  temp.tpm = C2K(25);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 11*365;     units.am = 'd'; label.am = 'life span';               bibkey.am = 'KitcHow1988';
  temp.am = C2K(25);  units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.tL = 'minimm value';

data.Lb  = 3.18; units.Lb  = 'cm';  label.Lb  = 'SVL at birth';  bibkey.Lb  = 'KitcHow1988';  
data.Lp  = 6.25;   units.Lp  = 'cm';  label.Lp  = 'SVL at puberty for females';  bibkey.Lp  = 'HowKitc1982';  
data.Lpm  = 5.5;   units.Lpm  = 'cm';  label.Lpm  = 'SVL at puberty for males';  bibkey.Lpm  = 'HowKitc1982';  
data.Li  = 6.8;  units.Li  = 'cm';  label.Li  = 'ultimate SVL for females';    bibkey.Li  = 'KitcHow1988';
data.Lim  = 6.0;  units.Lim  = 'cm';  label.Lim  = 'ultimate SVL for males';    bibkey.Lim  = 'guess';
  comment.Lim = 'based on Li*(Lpm/Lp)';

data.Wwi = 7.17; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'EoL';

data.Ri  = 2/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'KitcHow1988';
temp.Ri = C2K(25); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 eggs per clutch, 2 clutches per yr';

% univariate data
% time-length
data.tL = [ ... % time since birth (yr), SVL (cm)
0.095	3.198
0.585	3.488
0.750	3.762
0.916	3.965
1.074	4.208
1.412	4.599
1.578	4.513
1.758	4.544
1.923	4.967
2.081	5.186
2.757	5.554
2.923	5.476
3.082	5.765
3.586	5.617
3.752	5.843
3.924	5.781
4.082	6.219];
data.tL(:,1) = data.tL(:,1) * 365; % convert yr to d
units.tL  = {'d', 'cm'};  label.tL = {'time since birth', 'SVL'};  
temp.tL   = C2K(25);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'KitcHow1988'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 3 * weights.tL;
weights.Li = 3 * weights.Li;
weights.Lim = 3 * weights.Lim;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% facts
F1 = 'inhabits smooth-barked Eucalyptus trees; females are larger than males';
metaData.bibkey.F1 = 'KitcHow1988'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6M3F4'; % Cat of Life
metaData.links.id_ITIS = '818963'; % ITIS
metaData.links.id_EoL = '40081718'; % Ency of Life
metaData.links.id_Wiki = 'Hesperoedura_reticulata'; % Wikipedia
metaData.links.id_ADW = 'Oedura_reticulata'; % ADW
metaData.links.id_Taxo = '4683699'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Hesperoedura&species=reticulata'; % ReptileDB
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Hesperoedura_reticulata}}';   
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
bibkey = 'KitcHow1988'; type = 'Article'; bib = [ ...
'author = {D. J. Kitchener and R. A. How and J. Dell}, ' ...
'title = {Biology of \emph{Oedura reticulata} and \emph{Gehyra variegata} ({G}ekkonidae) in an Isolated Woodland of {W}estern {A}ustralia}, ' ...
'journal = {Journal of Herpetology}, ' ...
'volume = {22(4)}, ' ...
'pages = {401-412}, ' ...
'year = {1988}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'HowKitc1982'; type = 'Article'; bib = [ ...
'author = {R. A. How and D. J. }, ' ...
'title = {The Biology of the Gecko \emph{Oedura reticulata} {B}ustard, in a Small Habitat Isolate in the {W}estern {A}ustralian Wheatbelt}, ' ...
'journal = {Aust. Wildl. Res.}, ' ...
'volume = {10}, ' ...
'pages = {543-56}, ' ...
'year = {1983}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{https://eol.org/pages/40081718}}';   
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

